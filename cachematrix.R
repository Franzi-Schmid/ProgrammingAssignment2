## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

##my code below
## makematrix is a function that creates a matrix that can be cached
### the <<- superassignment operator looks for the variable on the right starting in the enclosing environment up to the global environment
##if no variable is found in the global environment then a variable is created

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
        ##set the inverse matrix
  setmatrix <- function(inverse_m) m <<- inverse_m
        ##get value of the inverse
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}

##cachematrix checks if the matrix has already been calculated and stored in the cache. if yes then it will retrieve the solution from the cache and return the inversed matrix
## if not it will input the matrix into the solve function and inverse the matrix

cacheSolve <- function(x, ...) {
        ##check if inverse has been calculated an can skip calculation
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
        ##inverse not computed yet, calculate via solve
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
}
