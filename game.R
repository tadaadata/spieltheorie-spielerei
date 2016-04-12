game <- function(turns) {
  
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
  
  
  rn <-    rnd(turns)
  co <-   coop(turns)
  df <- defect(turns)
  
  df <- data.frame(s1 = rn, s2 = co)
  
  resu <- within(df, {
    p1 <- ifelse(rn == F & co == T, 5, ifelse(rn == T & co == T, 3, ifelse(rn == F & co == F, 1, ifelse(rn == T & co == F, 0, 2))))
    p2 <- ifelse(rn == F & co == T, 0, ifelse(rn == T & co == T, 3, ifelse(rn == F & co == F, 1, ifelse(rn == T & co == F, 5, 2))))
  })
  
  return(resu)
}
