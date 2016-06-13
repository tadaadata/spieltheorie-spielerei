#### Init: Packages and functions required for the project ####

library(ggplot2)
if (!("gganimate" %in% installed.packages())) devtools::install_github("dgrtwo/gganimate")
library(gganimate)
library(dplyr)
library(tidyr)

#### Running a simulation ####

play_game <- function(strat_self = "tft", strat_enemy = "soft_majo", turns = 100) {
  game <- data_frame(self = rep(NA, turns),
                     enemy = rep(NA, turns),
                     score_self = rep(NA, turns),
                     score_enemy = rep(NA, turns))

  ## Strategies that coop in the first turn
  coop_first <- c("tft", "soft_majo", "coop", "spite", "per_kind", "pavlov", "prober")

  ## Strategies that are strictly sequential
  simple_strats <- c("random", "coop", "defect", "per_nasty", "per_kind")

  if (strat_self %in% simple_strats) {
    if (strat_self == "coop") {
      game$self <- rep(TRUE, nrow(game))
    } else if (strat_self == "defect"){
      game$self <- rep(FALSE, nrow(game))
    } else if (strat_self == "per_nasty"){
      game$self <- FALSE
      game$self[c(FALSE, FALSE, TRUE)] <- TRUE
    } else if (strat_self == "per_kind"){
      game$self <- TRUE
      game$self[c(FALSE, FALSE, TRUE)] <- FALSE
    } else if (strat_self == "random"){
      game$self <- sample(c(TRUE, FALSE), nrow(game), replace = T)
    }
  }
  if (strat_enemy %in% simple_strats) {
    if (strat_enemy == "coop") {
      game$enemy <- rep(TRUE, nrow(game))
    } else if (strat_enemy == "defect"){
      game$enemy <- rep(FALSE, nrow(game))
    } else if (strat_enemy == "per_nasty"){
      game$enemy <- FALSE
      game$enemy[c(FALSE, FALSE, TRUE)] <- TRUE
    } else if (strat_enemy == "per_kind"){
      game$enemy <- TRUE
      game$enemy[c(FALSE, FALSE, TRUE)] <- FALSE
    } else if (strat_enemy == "random"){
      game$enemy <- sample(c(TRUE, FALSE), nrow(game), replace = T)
    }
  }


  for (i in seq(turns)) {
    if (i == 1) {
      # self first turn
      if (strat_self %in% coop_first) {
        game[1, "self"] <- TRUE
      } else if (strat_self == "random"){
        game[1, "self"] <- sample(c(TRUE, FALSE), 1)
      } else {
        game[1, "self"] <- FALSE
      }
      # enemy first turn
      if (strat_enemy %in% coop_first){
        game[1, "enemy"] <- TRUE
      } else if (strat_enemy == "random"){
        game[1, "enemy"] <- sample(c(TRUE, FALSE), 1)
      } else {
        game[1, "enemy"] <- FALSE
      }
    } else {
      # self strats
      if (strat_self == "tft" | strat_self == "mistrust"){
        game[i, "self"] <- game[i - 1, "enemy"]
      } else if (strat_self == "spite") {
        game[i, "self"] <- ifelse(FALSE %in% game$enemy[1:i-1], FALSE, TRUE)
      } else if (strat_self == "soft_majo") {
        game[i, "self"] <- as.logical(names(table(game$enemy))[table(game$enemy) == max(table(game$enemy))])[1]
      } else if (strat_self == "pavlov") {
        game[i, "self"] <- ifelse(game[i-1, 1] == game[i-1, 2], TRUE, FALSE)
      } else if (strat_self == "prober") {
        if (i == 2) {
          game[i, "self"] <- FALSE
        } else if (i == 3) {
          game[i, "self"] <- FALSE
        } else {
          game[i, "self"] <- ifelse(game$enemy[2] & game$enemy[3] == TRUE, FALSE, game[i - 1, "enemy"])
        }
      }

      # enemy strats
      if (strat_enemy == "soft_majo"){
        game[i, "enemy"] <- as.logical(names(table(game$self))[table(game$self) == max(table(game$self))])[1] # soft_majo
      } else if (strat_enemy == "tft" | strat_enemy == "mistrust") {
        game[i, "enemy"] <- game[i - 1, "self"]
      } else if (strat_enemy == "spite") {
        game[i, "enemy"] <- ifelse(FALSE %in% game$self[1:i-1], FALSE, TRUE)
      } else if (strat_enemy == "pavlov") {
        game[i, "enemy"] <- ifelse(game[i-1, 1] == game[i-1, 2], TRUE, FALSE)
      } else if (strat_enemy == "prober") {
        if (i == 2) {
          game[i, "enemy"] <- FALSE
        } else if (i == 3) {
          game[i, "enemy"] <- FALSE
        } else {
          game[i, "enemy"] <- ifelse(game$self[2] & game$self[3] == TRUE, FALSE, game[i - 1, "self"])
        }
      }
    }
  }

  ## Get the score
  game %>% calc_score() -> game

  return(game)
}

calc_score <- function(game = NULL) {
  if (is.null(game)) return(NULL)

  game$score_self <- vapply(seq(nrow(game)), function(i){
                      score <- ifelse(identical(as.logical(game[i, c(1, 2)]), c(TRUE, TRUE)), yes = 3,
                                      ifelse(identical(as.logical(game[i, c(1, 2)]), c(TRUE, FALSE)), yes = 0,
                                             ifelse(identical(as.logical(game[i, c(1, 2)]), c(FALSE, TRUE)), yes = 5,
                                                    ifelse(identical(as.logical(game[i, c(1, 2)]), c(FALSE, FALSE)), yes = 1, no = NULL))))
                      return(score)
                    }, FUN.VALUE = numeric(1), USE.NAMES = F)

  game$score_enemy <- ifelse(game$score_self == 1, 1,
                             ifelse(game$score_self == 5, 0,
                                    ifelse(game$score_self == 0, 5,
                                           ifelse(game$score_self == 3, 3, NA))))
  
  # getting rid of actual plays for compatibility with abomination.R m)
  game$self <- NULL
  game$enemy <- NULL
  
  return(game)
}


#### Adaptive strategies ####

# tit for tat
# kooperiere im ersten Zug,
# in jedem weiteren Zug spiele den Zug, den der Gegner bei letzten Mal benutzt hat.
tft <- function(turns) {
  turns <- seq(turns)

  for (i in turns) {
    if (i == 1) {
      x = TRUE
    } else {
      x[i] <- games[i-1, 1]
    }
  }
  return(x)
}

# soft majority; done
# spiele den meistbenutzten Zug des Gegners, bei Gleichheit kooperiere
soft_majo <- function(turns) {
  turns <- seq(turns)

  for (i in turns) {
    if (i == 1) {
      x <- TRUE
    } else {
      tbl <- prop.table(table(games[1:(i-1), 1]))
      x[i] <- ifelse(tbl[1] <= 0.5, TRUE, FALSE)
    }
  }

  return(x)
}
