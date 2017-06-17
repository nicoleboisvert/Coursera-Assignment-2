## the following is a pair of functions that cache the inverse of a matrix

## This function creates a special "matrix" object that can 
## cache its inverse. Following the example given, the function 
## sets the matrix, gets the matrix, then sets the inverse and gets the inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Following the same format as the assignment example,
## this function computes the inverse of the matrix and caches it. 
## if you use the function on the same matrix twice, you will
## get message that it's getting the cached data

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}
