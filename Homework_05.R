---
title: "Homework 5"
author: "Sam Brewer"
date: "2/16/2022"
output: html_document
---

# Homework 5

**Question 1**

```{r}
n_dims <- sample(x=3:10,size=1)
# print(n_dims)

# (n_dims)^2
vector_one <- 1:(n_dims)^2
# print(vector_one)

vector_one <- sample(x=vector_one)
# print(vector_one)

sq_matrix <- matrix(vector_one, nrow= n_dims)

print(sq_matrix)

?t # fxn to transpose matrix in r
sq_matrix <- t(sq_matrix)

print(sq_matrix) # the rows are now columns and vice versa

# ?sum
row_one_sum <- sum(sq_matrix[1,])
print(row_one_sum)
last_row_sum <- sum(sq_matrix[dim(sq_matrix)[1],])
print(last_row_sum)
# ?mean
row_one_mean <- mean(sq_matrix[1,])
print(row_one_mean)
last_row_mean <- mean(sq_matrix[dim(sq_matrix)[1],])
print(last_row_mean)

?eigen
eigen(sq_matrix)

typeof(eigen(sq_matrix)$values) # doubles
typeof(eigen(sq_matrix)$vectors) # doubles

```

**Question 2**

```{r}




```
