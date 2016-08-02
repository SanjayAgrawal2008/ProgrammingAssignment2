## Below are two functions that are used to create a special object that 
## stores a matrix and cache's its inverse

## The first function, makeCacheMatrix creates a list containing a function to

## set the matrix
## get the matrix
## set the inverse of matrix
## get the inverse of matrix

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


## The following function inverse the matrix passed 
## with the above function. However, it first checks to see if the inverse has 
## already been generated for the matrix. If so, it gets the inverse matrix from the cache and skips
## the computation. Otherwise, it generated the inverse of the matrix and sets the
## inverse of matrix in the cache via the setInv function.

cacheSolve <- function(x, ...) {
       i <- x$getInv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setInv(i)
  i ## Returns a matrix that is the inverse of 'x'
}
