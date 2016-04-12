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


per_kind  <- function() {
  for ('jedes erste und zweite' i in turns) {
    print(TRUE)
  }
  
  for ('jedes dritte' i in turns) {
    print(FALSE)
  }
}


per_nasty <- function() {
  for ('jedes erste und zweite' i in turns) {
    print(FALSE)
  }
  
  for ('jedes dritte' i in turns) {
    print(TRUE)
  }
}


soft_majo <- function() {
  if (Gegenspieler(TRUE) / Gegenspieler_n >= 0.5) {
    x <- TRUE
  } else {
    x <- FALSE
  }
  
  return(x)
}

spite <- function() {
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


tit_for_tat <- function() {
  start_with(TRUE)
  if (Gegenspieler == "TRUE") {
    x <- TRUE
  } else {
    x <- FALSE
  }
  
  return(x)
}
