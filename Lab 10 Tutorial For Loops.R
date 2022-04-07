# Lab 10 Tutorial: For Loops
# 30 March 2022
# SKB

# nested for loops---------------------------------------

# create a sample matrix
mat <- matrix(sample(1:10, size=9 ), nrow=3, ncol=3)
print(mat)

# writing the for loop
for(i in 1:nrow(mat)){ # values 1:3
 for(j in 1:ncol(mat)){
  print(mat[i,j]) 
 }
}

# putting custom fxn in for loops---------------------------------------
# simulating temp data
site1 <- runif(min=60, max=70, n=10)
site2 <- runif(min=60, max=70, n=10)
site3 <- runif(min=40, max=50, n=10)

# put them in a df:
temps.df <- cbind(site1, site2, site3)

# fxn to convert f to c
degf.to.defc <- function(x){
  degc <- (x-32)*(5/9)
  return(degc)
}

# repeat fxn using a for loop
for(i in 1:ncol(temps.df)){
 print(degf.to.defc(x=temps.df[,i])) 
}
