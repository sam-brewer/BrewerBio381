# Lab 8 Tutorial: Data Sims
# 16 March 2022
# SKB

library(boot)

#------------------------------------------------------------------------------
# why simulate data?
# saves time: write parts of code before you have data
# baseline for comparisons: check assumptions in your data
# test new stats techniques

# Part 1
# start with grouped of data
# for t-tests or ANOVA

# simulate groups with 20 observations
group1 <- rnorm(n=20, mean=2, sd=1)
hist(group1)

# change some parameters
group2 <- rnorm(n=20, mean=5, sd=1)
group3 <- rnorm(n=20, mean=2, sd=3)
hist(group2)
hist(group3)

#------------------------------------------------------------------------------
# simulate data for a linear regression
# two continuous normal variables
# start simple: assume an intercept of zero
# call the slope bets1
# x is the predictor variable

# start with a constant slope
beta1 <- 1

# our predictor variable is normally distributed
x <- rnorm(n=20)

# linear model:
y <- beta1*x
y == x # check if model works as is should when slope = 1

# you can play with different slopes
beta1 <- 1.5
y <- beta1*x

# you can add an intercept
beta0 <- 2
y <- beta0 + beta1*x
y

# slope and intercept can be literature values for accuracy in simulations

#------------------------------------------------------------------------------

# Part 2: Abundance / count data

# Option 1: data are normal-ish
# use round() to remove decimals
abund1 <- round(rnorm(n=20, mean=50, sd=10))
hist(abund1)                

# Option 2: Poisson distribution
abund2 <- rpois(n=20, lambda=3) # lambda is expected number of counts
barplot(table(abund2)) # table tallies up the different numbers

# sometimes the environment affects counts (other impact, not random)
# to account for that, first create our lambdas
# then use lambdas to get counts

# use a regression to get initial values
pre.lambda <- beta0 + beta1*x
# inverse og to ensure lambda is positive
lambda <- exp(pre.lambda)

# use lambda to get counts
abund3 <- rpois(n=20, lambda=lambda)
hist(abund3)

#----------------------------------------------------------------------------
# Part 3: Occupancy, presence/absence data
# Option 1: getting probs from a beta distribution
probs <-rbeta(n=20, shape=1, shape2=1) # prob of success
occ1 <- rbinom(n=20, size=1, prob=probs) # 20 observation with one trial
print(occ1)

# Option 2: occupancy with a covariate
# similar to above, except we are generating probs, not lambdas

pre.probs <- beta0 + beta1*x
print(pre.probs)

# convert to 0-1 scale
psi <- inv.logit(pre.probs)

# create new occupancy data
occ2 <- rbinom(n=20, size=1, prob=psi)
print(occ2)

