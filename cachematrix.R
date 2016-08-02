## Below are two functions that are used to create a special object that stores a matrix and cache's its inverse.

## The first function, makeCacheMatrix will return a list containing a function to

## set the value of the vector
## get the value of the vector
## set the value of the mean
## get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInv <- function(invMatrix) i <<- invMatrix
  getInv <- function() i
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}

## The following function genertaes the inverse of the matrix, created with 
## the above function. However, it first checks to see if the inverse has already been 
## calculated. If so, it gets the inverse matrix from the cache and skips the computation. Otherwise,
##it genertaes the inverse of the matrix and sets the inverse matrix in the cache via the setInv function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         i <- x$getInv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setInv(i)
  i
}
