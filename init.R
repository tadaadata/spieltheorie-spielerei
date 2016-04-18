#### Init: Packages and functions required for the project ####

library(ggplot2)
if (!("gganimate" %in% installed.packages())) devtools::install_github("dgrtwo/gganimate")
library(gganimate)
library(dplyr)

#### Running a simulation ####

play_game <- function(strat_self = "tft", strat_enemy = "soft_majo", turns = 100) {
  game <- data_frame(self = rep(NA, turns),
                     enemy = rep(NA, turns),
                     score_self = rep(NA, turns),
                     score_enemy = rep(NA, turns))

  ## Strategies that coop in the first turn
  coop_first <- c("tft", "soft_majo", "coop")

  for (i in seq(turns)) {
    if (i == 1) {
      # self first turn
      if (strat_self %in% coop_first) {
        game[1, "self"] <- TRUE
      } else {
        game[1, "self"] <- FALSE
      }
      # enemy first turn
      if (strat_enemy %in% coop_first){
        game[1, "enemy"] <- TRUE
      } else {
        game[1, "enemy"] <- FALSE
      }
    } else {
      # self strats
      if (strat_self == "tft"){
        game[i, "self"] <- game[i - 1, "enemy"]
      } else if (strat_self == "defect") {
        game[i, "self"] <- FALSE
      } else if (strat_self == "coop") {
        game[i, "self"] <- TRUE
      }

      # enemy strats
      if (strat_enemy == "soft_majo"){
        game[i, "enemy"] <- as.logical(names(table(game$self))[table(game$self) == max(table(game$self))])[1] # soft_majo
      } else if (strat_enemy == "defect") {
        game[i, "enemy"] <- FALSE
      } else if (strat_enemy == "coop") {
        game[i, "enemy"] <- TRUE
      } else if (strat_enemy == "tft") {
        game[i, "enemy"] <- game[i - 1, "self"]
      }
    }
  }

  ## Get the score
  game %>% calc_score() -> game

  return(game)
}

calc_score <- function(game = NULL) {
  if (is.null(game)) return(NULL)

  score <- rep(NA, nrow(game))
  game$score_self <- vapply(seq(nrow(game)), function(i){
                      score <- ifelse(identical(as.logical(game[i, c(1, 2)]), c(TRUE, TRUE)), yes = 3,
                                      ifelse(identical(as.logical(game[i, c(1, 2)]), c(TRUE, FALSE)), yes = 5,
                                             ifelse(identical(as.logical(game[i, c(1, 2)]), c(FALSE, TRUE)), yes = 0,
                                                    ifelse(identical(as.logical(game[i, c(1, 2)]), c(FALSE, FALSE)), yes = 1, no = NULL))))
                      return(score)
                    }, FUN.VALUE = numeric(1), USE.NAMES = F)
  game$score_enemy <- ifelse(game$score_self == 1, 1,
                             ifelse(game$score_self == 5, 0,
                                    ifelse(game$score_self == 0, 5,
                                           ifelse(game$score_self == 3, 3, NA))))
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
