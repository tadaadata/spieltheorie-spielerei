# initialize populations # last generation
pops <- data.frame(coop   = 100,
                   defect = 100,
                   rnd    = 100)

last_gen <- pops


# wrap it all up
evolve <- function(generations = 20) {
  for (i in seq(1:generations)) {
    # play games
    coop_rnd              <- play_game(strat_self = "coop", 
                                       strat_enemy = "random", 
                                       turns = 200)
    colnames(coop_rnd)    <- c("coop", "rnd")

    coop_defect           <- play_game(strat_self = "coop", 
                                       strat_enemy = "defect", 
                                       turns = 200)
    colnames(coop_defect) <- c("coop", "defect")

    rnd_defect            <- play_game(strat_self = "random", 
                                       strat_enemy = "defect", 
                                       turns = 200)
    colnames(rnd_defect)  <- c("rnd", "defect")

    # unify & sum up dataframes
    pre_gen <- cbind(coop_rnd, coop_defect, rnd_defect)

    gen <- sapply(unique(names(pre_gen)), 
           function(x) unname(unlist(pre_gen[ , names(pre_gen) == x]))) %>% 
      as.data.frame() %>% 
      summarize(coop   = sum(coop),
                defect = sum(defect),
                rnd    = sum(rnd))

    # entweder:
    # vor koeff.-berechnung die punktzahlen gewichten:
    #   gen <- last_gen / 100 * rowSums(gen)
    
    
    
    # 'calculate' coefficients
    gen <- gen / (rowSums(gen)/3)

    # 'calculate' population adjustments
    # adjust <- floor((gen - 1) * 10)

    # determine new population
    last_gen <- round(last_gen * gen)

    # append to generation history
    pops <- rbind(pops, last_gen)
  }
  
  # rm(coop_rnd, coop_defect, rnd_defect, pre_gen, gen)
  return(pops)
}





# plot stuff
pops <- pops %>% 
  mutate(Generation = 1:length(coop)) 

tlist <- list(pops[1, ], pops[2, ], pops[3, ], pops[4, ], pops[5, ],
              pops[6, ], pops[7, ], pops[8, ], pops[9, ], pops[10, ], 
              pops[11, ], pops[12, ], pops[13, ], pops[14, ], 
              pops[15, ])

pop_tweenr <- tween_states(tlist, tweenlength = 5, statelength = 0,
                           ease = "sine-in-out", nframes = 30)


pop_trans <- pop_tweenr %>% 
  gather(Strategy, Population, coop, defect, rnd)


tweenr <- ggplot(pop_trans) +
  geom_smooth(aes(x = Generation, y = Population, color = Strategy, 
                  frame = .frame, cumulative = T), 
              stat = "identity", alpha = 0.6, size = 1.5, se = F) +
  scale_color_hc() + theme_hc()



gg_animate(tweenr, interval = 0.5, filename = "~/tweenr.mp4", 
           ani.width = 960, ani.heigth = 720)
