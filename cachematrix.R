## My function will calculate the inverse of matrix and populate if it was not already calculated.
## elsewise it will just take the already calculated inverse matrix and populate

## makeChacheMatrix will set, get ,get the inverse and set the inverse of matrix

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


It will calculate the inverse of matrix if not already done

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
