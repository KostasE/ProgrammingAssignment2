##This is a set o functions that creates the inverse of an inversable matrix
##using the solve function.

##The first function is in fact a list of 4 functions that either cache the
##new matrix (set,get) or cache an already computed inverse matrix(setinverse, getinverse). 

makeCacheMatrix <- function(x = matrix()) {
        iv <- NULL
        set <- function(y) {    ##This part caches the new matrix        
                x <<- y
                iv <<- NULL
        }
        get <- function() x     ##This part gets the matrix cached with set
        setinverse <- function(inverse) iv <- inverse   ##This part caches an inversed matrix 
        getinverse <- function() iv                     ##This part gets the inversed matrix
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse) 
}

## THis is the function that computes the inversed matrix if it is not already cached
cacheSolve <- function(x, ...) {
        iv <- x$getinverse()
        if(!is.null(iv)) {              ##Checks if there is a cached value and returns it
                message("Getting cached data")
                return(m)
        }
        data <- x$get()         ##Gets the new matrix
        iv <- solve(data)       ##Computes the inversed matrix
        x$setinverse(iv)        ##Caches the inversed matrix
        iv
}