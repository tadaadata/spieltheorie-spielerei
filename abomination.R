runs <- function(tourneys = 200) {

## Unfassbar hässlicher hack um nachher ein paar Spiele abbilden zu können
tft_sm                <- play_game(turns = tourneys)
colnames(tft_sm)      <- c("tft", "sm")

tft_coop              <- play_game(strat_enemy = "coop", turns = tourneys)
colnames(tft_coop)    <- c("tft", "coop")

tft_rnd               <- play_game(strat_enemy = "random", turns = tourneys)
colnames(tft_rnd)     <- c("tft", "rnd")

tft_defect            <- play_game(strat_enemy = "defect", turns = tourneys)
colnames(tft_defect)  <- c("tft", "defect")

tft_spite             <- play_game(strat_enemy = "spite", turns = tourneys)
colnames(tft_spite)   <- c("tft", "spite")

tft_pk                <- play_game(strat_enemy = "per_kind", turns = tourneys)
colnames(tft_pk)      <- c("tft", "pk")

tft_pn                <- play_game(strat_enemy = "per_nasty", turns = tourneys)
colnames(tft_pn)      <- c("tft", "pn")

tft_mistrust          <- play_game(strat_enemy = "mistrust", turns = tourneys)
colnames(tft_mistrust) <- c("tft", "mistrust")

tft_pavlov             <- play_game(strat_enemy = "pavlov", turns = tourneys)
colnames(tft_pavlov)   <- c("tft", "pavlov")

tft_prober             <- play_game(strat_enemy = "prober", turns = tourneys)
colnames(tft_prober)   <- c("tft", "prober")


coop_rnd              <- play_game(strat_self = "coop", strat_enemy = "random", turns = tourneys)
colnames(coop_rnd)    <- c("coop", "rnd")

coop_defect           <- play_game(strat_self = "coop", strat_enemy = "defect", turns = tourneys)
colnames(coop_defect) <- c("coop", "defect")

coop_spite            <- play_game(strat_self = "coop", strat_enemy = "spite", turns = tourneys)
colnames(coop_spite)  <- c("coop", "spite")

coop_sm               <- play_game(strat_self = "coop", turns = tourneys)
colnames(coop_sm)     <- c("coop", "sm")

coop_pk               <- play_game(strat_self = "coop", strat_enemy = "per_kind", turns = tourneys)
colnames(coop_pk)     <- c("coop", "pk")

coop_pn               <- play_game(strat_self = "coop", strat_enemy = "per_nasty", turns = tourneys)
colnames(coop_pn)     <- c("coop", "pn")

coop_mistrust           <- play_game(strat_self = "coop", strat_enemy = "mistrust", turns = tourneys)
colnames(coop_mistrust) <- c("coop", "mistrust")

coop_pavlov            <- play_game(strat_self = "coop", strat_enemy = "pavlov", turns = tourneys)
colnames(coop_pavlov)  <- c("coop", "pavlov")

coop_prober            <- play_game(strat_self = "coop", strat_enemy = "prober", turns = tourneys)
colnames(coop_prober)  <- c("coop", "prober")


rnd_defect            <- play_game(strat_self = "random", strat_enemy = "defect", turns = tourneys)
colnames(rnd_defect)  <- c("rnd", "defect")

rnd_spite             <- play_game(strat_self = "random", strat_enemy = "spite", turns = tourneys)
colnames(rnd_spite)   <- c("rnd", "spite")

rnd_sm                <- play_game(strat_self = "random", turns = tourneys)
colnames(rnd_sm)      <- c("rnd", "sm")

rnd_pk                <- play_game(strat_self = "random", strat_enemy = "per_kind", turns = tourneys)
colnames(rnd_pk)      <- c("rnd", "pk")

rnd_pn                <- play_game(strat_self = "random", strat_enemy = "per_nasty", turns = tourneys)
colnames(rnd_pn)      <- c("rnd", "pn")

rnd_mistrust            <- play_game(strat_self = "random", strat_enemy = "mistrust", turns = tourneys)
colnames(rnd_mistrust)  <- c("rnd", "mistrust")

rnd_pavlov             <- play_game(strat_self = "random", strat_enemy = "pavlov", turns = tourneys)
colnames(rnd_pavlov)   <- c("rnd", "pavlov")

rnd_prober             <- play_game(strat_self = "random", strat_enemy = "prober", turns = tourneys)
colnames(rnd_prober)   <- c("rnd", "prober")


defect_spite          <- play_game(strat_self = "defect", strat_enemy = "spite", turns = tourneys)
colnames(defect_spite) <- c("defect", "spite")

defect_sm             <- play_game(strat_self = "defect", turns = tourneys)
colnames(defect_sm)   <- c("defect", "sm")

defect_pk             <- play_game(strat_self = "defect", strat_enemy = "per_kind", turns = tourneys)
colnames(defect_pk)   <- c("defect", "pk")

defect_pn             <- play_game(strat_self = "defect", strat_enemy = "per_nasty", turns = tourneys)
colnames(defect_pn)   <- c("defect", "pn")

defect_mistrust           <- play_game(strat_self = "defect", strat_enemy = "mistrust", turns = tourneys)
colnames(defect_mistrust) <- c("defect", "mistrust")

defect_pavlov           <- play_game(strat_self = "defect", strat_enemy = "pavlov", turns = tourneys)
colnames(defect_pavlov) <- c("defect", "pavlov")

defect_prober           <- play_game(strat_self = "defect", strat_enemy = "prober", turns = tourneys)
colnames(defect_prober) <- c("defect", "prober")


spite_sm              <- play_game(strat_self = "spite", turns = tourneys)
colnames(spite_sm)    <- c("spite", "sm")

spite_pk              <- play_game(strat_self = "spite", strat_enemy = "per_kind", turns = tourneys)
colnames(spite_pk)    <- c("spite", "pk")

spite_pn              <- play_game(strat_self = "spite", strat_enemy = "per_nasty", turns = tourneys)
colnames(spite_pn)    <- c("spite", "pn")

spite_mistrust           <- play_game(strat_self = "spite", strat_enemy = "mistrust", turns = tourneys)
colnames(spite_mistrust) <- c("spite", "mistrust")

spite_pavlov              <- play_game(strat_self = "spite", strat_enemy = "pavlov", turns = tourneys)
colnames(spite_pavlov)    <- c("spite", "pavlov")

spite_prober              <- play_game(strat_self = "spite", strat_enemy = "prober", turns = tourneys)
colnames(spite_prober)    <- c("spite", "prober")


sm_pk                 <- play_game(strat_self = "soft_majo", strat_enemy = "per_kind", turns = tourneys)
colnames(sm_pk)       <- c("sm", "pk")

sm_pn                 <- play_game(strat_self = "soft_majo", strat_enemy = "per_nasty", turns = tourneys)
colnames(sm_pn)       <- c("sm", "pn")

sm_mistrust           <- play_game(strat_self = "soft_majo", strat_enemy = "mistrust", turns = tourneys)
colnames(sm_mistrust) <- c("sm", "mistrust")

sm_pavlov                 <- play_game(strat_self = "soft_majo", strat_enemy = "pavlov", turns = tourneys)
colnames(sm_pavlov)       <- c("sm", "pavlov")

sm_prober                 <- play_game(strat_self = "soft_majo", strat_enemy = "prober", turns = tourneys)
colnames(sm_prober)       <- c("sm", "prober")


pk_pn                 <- play_game(strat_self = "per_kind", strat_enemy = "per_nasty", turns = tourneys)
colnames(pk_pn)       <- c("pk", "pn")

pk_mistrust                 <- play_game(strat_self = "per_kind", strat_enemy = "mistrust", turns = tourneys)
colnames(pk_mistrust)       <- c("pk", "mistrust")

pk_pavlov                 <- play_game(strat_self = "per_kind", strat_enemy = "pavlov", turns = tourneys)
colnames(pk_pavlov)       <- c("pk", "pavlov")

pk_prober                 <- play_game(strat_self = "per_kind", strat_enemy = "prober", turns = tourneys)
colnames(pk_prober)       <- c("pk", "prober")


pn_mistrust                 <- play_game(strat_self = "per_nasty", strat_enemy = "mistrust", turns = tourneys)
colnames(pn_mistrust)       <- c("pn", "mistrust")

pn_pavlov                 <- play_game(strat_self = "per_nasty", strat_enemy = "pavlov", turns = tourneys)
colnames(pn_pavlov)       <- c("pn", "pavlov")

pn_prober                 <- play_game(strat_self = "per_nasty", strat_enemy = "prober", turns = tourneys)
colnames(pn_prober)       <- c("pn", "prober")


mistrust_pavlov                 <- play_game(strat_self = "mistrust", strat_enemy = "pavlov", turns = tourneys)
colnames(mistrust_pavlov)       <- c("mistrust", "pavlov")

mistrust_prober                 <- play_game(strat_self = "mistrust", strat_enemy = "prober", turns = tourneys)
colnames(mistrust_prober)       <- c("mistrust", "prober")


pavlov_prober                 <- play_game(strat_self = "pavlov", strat_enemy = "prober", turns = tourneys)
colnames(pavlov_prober)       <- c("pavlov", "prober")



tft_tft               <- play_game(strat_enemy = "tft", turns = tourneys)
colnames(tft_tft)     <- c("tft", "tft")

coop_coop             <- play_game(strat_self = "coop", strat_enemy = "coop", turns = tourneys)
colnames(coop_coop)   <- c("coop", "coop")

defect_defect         <- play_game(strat_self = "defect", strat_enemy = "defect", turns = tourneys)
colnames(defect_defect) <- c("defect", "defect")

rnd_rnd               <- play_game(strat_self = "random", strat_enemy = "random", turns = tourneys)
colnames(rnd_rnd)     <- c("rnd", "rnd")

spite_spite           <- play_game(strat_self = "spite", strat_enemy = "spite", turns = tourneys)
colnames(spite_spite) <- c("spite", "spite")

sm_sm                 <- play_game(strat_self = "soft_majo", turns = tourneys)
colnames(sm_sm)       <- c("sm", "sm")

pk_pk                 <- play_game(strat_self = "per_kind", strat_enemy = "per_kind", turns = tourneys)
colnames(pk_pk)       <- c("pk", "pk")

pn_pn                 <- play_game(strat_self = "per_nasty", strat_enemy = "per_nasty", turns = tourneys)
colnames(pn_pn)       <- c("pn", "pn")

mistrust_mistrust           <- play_game(strat_self = "mistrust", strat_enemy = "mistrust", turns = tourneys)
colnames(mistrust_mistrust) <- c("mistrust", "mistrust")

pavlov_pavlov           <- play_game(strat_self = "pavlov", strat_enemy = "pavlov", turns = tourneys)
colnames(pavlov_pavlov) <- c("pavlov", "pavlov")

prober_prober           <- play_game(strat_self = "prober", strat_enemy = "prober", turns = tourneys)
colnames(prober_prober) <- c("prober", "prober")


## daraus jetzt einen großen Turnier-dataframe bauen

  # versuch <- plyr::join(tft_coop, tft_rnd)

# Idee:
# Allen DFs die g1 & g2 Spalte entfernen, 
# die Spalten aneinander pappen und später dann passend machen

versuch <- cbind(coop_defect, coop_rnd, coop_spite, defect_spite, rnd_defect, 
                 rnd_spite, tft_coop, tft_defect, tft_rnd, tft_spite,
                 coop_coop, defect_defect, rnd_rnd, spite_spite, tft_tft, sm_sm,
                 tft_sm, coop_sm, defect_sm, rnd_sm, spite_sm,
                 tft_pk, tft_pn, tft_mistrust, coop_pk, coop_pn, coop_mistrust,
                 rnd_pk, rnd_pn, rnd_mistrust, defect_pk, defect_pn, defect_mistrust,
                 spite_pk, spite_pn, spite_mistrust, sm_pk, sm_pn, sm_mistrust,
                 pk_pn, pk_mistrust, pn_mistrust, pk_pk, pn_pn, mistrust_mistrust,
                 pavlov_pavlov, prober_prober, tft_pavlov, tft_prober, coop_pavlov,
                 coop_prober, rnd_pavlov, rnd_prober, defect_pavlov, defect_prober,
                 spite_pavlov, spite_prober, sm_pavlov, sm_prober, pk_pavlov, pk_prober,
                 pn_pavlov, pn_prober, mistrust_pavlov, mistrust_prober, pavlov_prober)

tidy <- sapply(unique(names(versuch)), 
               function(x) unname(unlist(versuch[ , names(versuch) == x]))) %>% 
          as.data.frame()

rm(coop_defect, coop_rnd, coop_spite, defect_spite, rnd_defect, 
   rnd_spite, tft_coop, tft_defect, tft_rnd, tft_spite,
   coop_coop, defect_defect, rnd_rnd, spite_spite, tft_tft, sm_sm,
   tft_sm, coop_sm, defect_sm, rnd_sm, spite_sm,
   tft_pk, tft_pn, tft_mistrust, coop_pk, coop_pn, coop_mistrust,
   rnd_pk, rnd_pn, rnd_mistrust, defect_pk, defect_pn, defect_mistrust,
   spite_pk, spite_pn, spite_mistrust, sm_pk, sm_pn, sm_mistrust,
   pk_pn, pk_mistrust, pn_mistrust, pk_pk, pn_pn, mistrust_mistrust,
   pavlov_pavlov, prober_prober, tft_pavlov, tft_prober, coop_pavlov,
   coop_prober, rnd_pavlov, rnd_prober, defect_pavlov, defect_prober,
   spite_pavlov, spite_prober, sm_pavlov, sm_prober, pk_pavlov, pk_prober,
   pn_pavlov, pn_prober, mistrust_pavlov, mistrust_prober, pavlov_prober)

return(tidy)
}


## 5 Turniere spielen lassen:
tournament <- runs()
tournament <- tournament + runs()
tournament <- tournament + runs()
tournament <- tournament + runs()
tournament <- tournament + runs()

## angucken:
tournament %>% sapply(sum) %>% rank
