# The first function creates a matrix by performing 4 tasks:
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverse
# 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  # initialize the inverse matrix value
  inv <- NULL
  # set the value of the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  # get the value of the matrix
  get <- function() x
  # set the value of the inverse
  set_inverse <- function(inv_input) inv <<- inv_input
  # get the value of the inverse
  get_inverse <- function() inv
  # return a list of the above
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
  
}

# The second function calculates the inverse of the matrix created above.
# It first checks to see if the inverse is available.
# If yes, it retrieves the inverse from the cache.
# Otherwise, it calculates the inverse of the
# and sets the value of the inverse in the cache.

cacheSolve <- function(x, ...) {
  # check if the inverse is already cached,
  # if yes get the inverse from the cache directly
  inv <- x$get_inverse()
  if(!is.null(inv)) {
    message("retrieving inverse from cache")
    return(inv)
  }
  # else, get the matrix
  data <- x$get()
  # and calculate the inverse
  inv <- solve(data, ...)
  # thencache the inverse
  x$set_inverse(inv)
  # return the result
  inv
}