dt <- read.csv("hw1_data.csv")
dt

#ozone <- dt[ ,1, drop = FALSE]
ozone

bad <- is.na(ozone)
bad

good <- ozone[!bad]
good

sum(complete.cases(good))

mean(good)

bv <- good[ozone > 31]

dt[ , ]
gooddt <- complete.cases(dt)
omitbad <- dt[gooddt, ][,]

oz <- subset(omitbad, Ozone > 31)
temp_oz <- subset(oz, Temp > 90)
temp_oz

sol <- temp_oz[, "Solar.R"]
sol

mean(sol)

my <- subset(omitbad, Month == 6)
my

 tempSix <- my[, "Temp"]
 
 tempSix
 mean(tempSix)
