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


# per nasty; done
# spiele periodisch [defektiern, defektieren, kooperieren]
per_nasty <- function(turns) {
  x <- rep(FALSE, turns)
  x[c(FALSE, FALSE, TRUE)] <- TRUE
  return(x)
}


#### Reactive strategies ####

# soft majority; done
# spiele den meistbenutzten Zug des Gegners, bei Gleichheit kooperiere
soft_majo <- function(turns) {
  turns <- c(1:turns)
  
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


# spite; done
# kooperiere im ersten Zug, dann kooperiere, solange der Gegner noch nicht defektiert hat,
# danach defektiere immer
spite <- function(turns) {
  turns <- c(1:turns)
  
  for (i in turns) {
    if (i == 1) {
      x <- TRUE
    } else {
      tbl  <- table(games[1:(i-1), 1])
      x[i] <- ifelse(attr(tbl[1], "names") == "FALSE", FALSE, TRUE)
    }
  }
  
  return(x)
}


# tit for tat; done
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


# mistrust; done
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
# kooperiere im ersten Zug,
# dann nur, wenn beide Spieler denselben Zug gemacht haben
pavlov <- function(turns) {
  turns <- c(1:turns)
  for (i in turns) {
    if (i == 1) {
      games[i, 2] <<- TRUE
    } else {
      games[i, 2] <<- ifelse(games[i-1, 1] == games[i-1, 2], TRUE, FALSE)
    }
  }
  return(games[ , 2])
}
