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
  turns <- c(1:turns)
  x     <- FALSE

  for (i in turns) {
    x[i]   <- FALSE
  }

  for (i in floor(turns / 3)) {
    x[i*3] <- TRUE
  }

  return(x)
}


# soft majority; dummy
# spiele den meistbenutzten Zug des Gegners, bei Gleichheit kooperiere
soft_majo <- function(turns) {
  if (Gegenspieler(TRUE) / Gegenspieler_n >= 0.5) {
    x <- TRUE
  } else {
    x <- FALSE
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


# tit for tat; dummy
# kooperiere im ersten Zug,
# in jedem weiteren Zug spiele den Zug, den der Gegner bei letzten Mal benutzt hat.
tit_for_tat <- function(turns) {
  start_with(TRUE)
  if (Gegenspieler == "TRUE") {
    x <- TRUE
  } else {
    x <- FALSE
  }

  return(x)
}


# mistrust; dummy
# defektiere im ersten Zug, danach spiele wie tit-for-tat
tit_for_tat <- function(turns) {
  start_with(FALSE)
  if (Gegenspieler == "TRUE") {
    x <- TRUE
  } else {
    x <- FALSE
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
