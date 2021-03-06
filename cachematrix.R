## The following two functions are used to cache the inverse of a matrix.


# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set<-function(y){
                x<<-y
                m<<-NULL
        }
                get<-function() x
                setmatrix<-function(solve) m<<- solve
                getmatrix<-function() m
                list(set=set, get=get,
             setmatrix=setmatrix,
             getmatrix=getmatrix)
}

# This function returns the inverse of the matrix. It  checks if
# the inverse has already been computed. If so, it skips the
# computation. If not, it computes the inverse and sets the value in the cache.

cacheSolve <- function(x, ...) {
    
        m<-x$getmatrix()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        matrix<-x$get()
        m<-solve(matrix,...) 
        x$setmatrix(m)
        m
}
