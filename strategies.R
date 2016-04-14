#### Basics ####

# initial matrix
new_game <- function(turns){
  matrix(nrow = turns, ncol = 2, byrow = T)
}

#### None-reactive staretgies ####
# random; done
rnd <- function(turns) {
  turns <- c(1:turns)
  y     <- c(TRUE, FALSE)
  x     <- sample(y, 1, prob = c(0.5, 0.5), replace = T)

  for (i in turns) {
    x[i] <- sample(y, 1, prob = c(0.5, 0.5), replace = T)
  }

  return(x)
}

# cooperate; done
coop <- function(turns) {
  x <- rep(TRUE, turns)
  return(x)
}


# defect; done
defect <- function(turns) {
  x <- rep(FALSE, turns)
  return(x)
}


# per kind; done
# spiele periodisch [kooperieren, kooperieren, defektieren]
per_kind  <- function(turns) {
  x <- rep(TRUE, turns)
  x[c(FALSE, FALSE, TRUE)] <- FALSE
  return(x)
}


# per nasty; dummy
# spiele periodisch [defektiern, defektieren, kooperieren]
per_nasty <- function(turns) {
  x <- rep(FALSE, turns)
  x[c(FALSE, FALSE, TRUE)] <- TRUE
  return(x)
}


#### Reactive strategies ####

# soft majority; broken
# spiele den meistbenutzten Zug des Gegners, bei Gleichheit kooperiere
soft_majo <- function(turns) {
  turns <- c(1:turns)
  for (i in turns) {
    if (i == 1) {
      x <- TRUE
    } else {
      tbl <- table(games[1:(i-1), 1]) / length(games[1:(i-1), 1])
      
      if (tbl[2] < 0.5) {
        x[i] <- FALSE
      } else {
        x[i] <- TRUE
      }
    }
  }

  return(x)
}


# spite; dummy
# kooperiere im ersten Zug, dann kooperiere, solange der Gegner noch nicht defektiert hat,
# danach defektiere immer
spite <- function(turns) {
  start_with(TRUE)
  if (Gegenspieler == "TRUE") {
    x <- TRUE
  } else {
    always(
    x <- FALSE
    )
  }

  return(x)
}


# tit for tat; pseudodone
# kooperiere im ersten Zug,
# in jedem weiteren Zug spiele den Zug, den der Gegner bei letzten Mal benutzt hat.
tft <- function(turns) {
  turns <- c(1:turns)
  for (i in turns) {
    if (i == 1) {
      x = TRUE
    } else {
      x[i] <- games[i-1, 1]
    }
  }
  return(x)
}


# mistrust; pseudodone
# defektiere im ersten Zug, danach spiele wie tit-for-tat
mistrust <- function(turns) {
  turns <- c(1:turns)
  for (i in turns) {
    if (i == 1) {
      x = FALSE
    } else {
      x[i] <- games[i-1, 1]
    }
  }
  return(x)
}


# prober; dummy
# spiele die ersten drei Züge [kooperieren, defektieren, defektieren]
# defektiere in allen weiteren Zügen, wenn der Gegner im zweiten und dritten Zug kooperiert hat,
# sonst spiele tit-for-tat
prober <- function(turns) {
  start_with(TRUE, TRUE, FALSE)
  if (Gegenspieler[Zug 2 & 3] == "TRUE") {
    x <- always(FALSE)
  } else {
    tit_for_tat(turns)
  }

  return(x)
}


# pavlov; dummy
pavlov <- function(turns) {
  # kooperiere im ersten Zug,
  # dann nur, wenn beide Spieler denselben Zug gemacht haben

  # I don't even...
}
