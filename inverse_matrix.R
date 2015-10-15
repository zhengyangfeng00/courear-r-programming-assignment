makeCacheMatrix <- function(m) {
    inverse_m <- NULL
    set <- function(rhs) {
        m <<- rhs
        inverse_m <<- NULL
    }
    get <- function() m
    set_inverse <- function(rhs) inverse_m <<- rhs
    get_inverse <- function() inverse_m
    list(set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse)
}

cacheSolve <- function(m, ...) {
    inverse_m <- m$get_inverse()
    if (!is.null(inverse_m))
    {
        message("getting cached data")
        return(inverse_m)
    }
    data <- m$get()
    m$set_inverse( solve(data, ...) )
    m$get_inverse()
}