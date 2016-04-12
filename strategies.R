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
  turns <- c(1:turns)
  x     <- TRUE
  
  for (i in turns) {
    x[i] <- TRUE
  }
  
  return(x)
}


# defect; done
defect <- function(turns) {
  turns <- c(1:turns)
  x     <- FALSE
  
  for (i in turns) {
    x[i] <- FALSE
  }
  
  return(x)
}


# per kind; dummy
per_kind  <- function(turns) {
  for ('jedes erste und zweite' i in turns) {
    print(TRUE)
  }
  
  for ('jedes dritte' i in turns) {
    print(FALSE)
  }
}


# per nasty; dummy
per_nasty <- function(turns) {
  for ('jedes erste und zweite' i in turns) {
    print(FALSE)
  }
  
  for ('jedes dritte' i in turns) {
    print(TRUE)
  }
}


# soft majority; dummy
soft_majo <- function(turns) {
  if (Gegenspieler(TRUE) / Gegenspieler_n >= 0.5) {
    x <- TRUE
  } else {
    x <- FALSE
  }
  
  return(x)
}


# spite; dummy
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
