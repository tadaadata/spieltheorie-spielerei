rnd <- function() {
  y <- c(TRUE, FALSE)
  x <- sample(y, 1, prob = c(0.1, 0.1), replace = T)
  
  return(x)
}


coop <- TRUE

defect <- FALSE

per_kind  <- c(TRUE, TRUE, FALSE)
per_nasty <- c(FALSE, FALSE, TRUE)

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