## This function creates a special matrix that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	 inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) inv <<- solve
        getInverse <- function() inv
        list(set = set, get = get,
             setInverse = setInverse ,
             getInverse = getInverse )
	

}

##-------------------------------------------------------------
## This function return a matrix that is the inverse of 'x': first check if the 
## inverse matrix is already computed; if yes, return the inverse matrix, if not 
## compute the inverse using function solve() and then return it.

cacheSolve <- function(x=matrix(), ...) {
         
	 inv <- x$getInverse()
        if(!is.null(inv)) {
                message("getting cached matrix")
                return(inv)
        }
        data <- x$get()
        inv <- slove(data, ...)
        x$setInverse(inv)
        inv 

}
