Function “makeCacheMatrix” creates a special “matrix” object that can cache its inverse. makeCacheMatrix contains 4 functions: set, get, setmean, getmean.
(1)get is a function that returns the vector x stored in the main function.
(2)set is a function that changes the vector stored in the main function.
(3)setmean and getmean are functions very similar to set and get.
(4)They don’t calculate the mean, they simply store the value of the input in a variable m.
(5)into the main function makeVector (setmean) and return it (getmean).

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) m <<- solve
      getinverse <- function() m
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}

Function “cacheSolve” computes the inverse of the special “matrix” (which is the input of cachemean) returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache. If the inverse has not been calculated, data gets the matrix stored with makeCacheMatrix, m calculates the inverse, and x$setmean(m) stores it in the object m in makeCacheMatrix.

cacheSolve <- function(x, ...) {
      m <- x$getinverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinverse(m)
      m
}

EXAMPLE:
> a<-diag(9,6)
> a
     [,1] [,2] [,3] [,4] [,5] [,6]
[1,]    9    0    0    0    0    0
[2,]    0    9    0    0    0    0
[3,]    0    0    9    0    0    0
[4,]    0    0    0    9    0    0
[5,]    0    0    0    0    9    0
[6,]    0    0    0    0    0    9
> CachedMarix <- makeCacheMatrix(a)
> cacheSolve(CachedMarix)
          [,1]      [,2]      [,3]
[1,] 0.1111111 0.0000000 0.0000000
[2,] 0.0000000 0.1111111 0.0000000
[3,] 0.0000000 0.0000000 0.1111111
[4,] 0.0000000 0.0000000 0.0000000
[5,] 0.0000000 0.0000000 0.0000000
[6,] 0.0000000 0.0000000 0.0000000
          [,4]      [,5]      [,6]
[1,] 0.0000000 0.0000000 0.0000000
[2,] 0.0000000 0.0000000 0.0000000
[3,] 0.0000000 0.0000000 0.0000000
[4,] 0.1111111 0.0000000 0.0000000
[5,] 0.0000000 0.1111111 0.0000000
[6,] 0.0000000 0.0000000 0.1111111
> b <- diag(9,6)
> b
     [,1] [,2] [,3] [,4] [,5] [,6]
[1,]    9    0    0    0    0    0
[2,]    0    9    0    0    0    0
[3,]    0    0    9    0    0    0
[4,]    0    0    0    9    0    0
[5,]    0    0    0    0    9    0
[6,]    0    0    0    0    0    9
> CachedMarix <- makeCacheMatrix(b)
> cacheSolve(CachedMarix)  
          [,1]      [,2]      [,3]
[1,] 0.1111111 0.0000000 0.0000000
[2,] 0.0000000 0.1111111 0.0000000
[3,] 0.0000000 0.0000000 0.1111111
[4,] 0.0000000 0.0000000 0.0000000
[5,] 0.0000000 0.0000000 0.0000000
[6,] 0.0000000 0.0000000 0.0000000
          [,4]      [,5]      [,6]
[1,] 0.0000000 0.0000000 0.0000000
[2,] 0.0000000 0.0000000 0.0000000
[3,] 0.0000000 0.0000000 0.0000000
[4,] 0.1111111 0.0000000 0.0000000
[5,] 0.0000000 0.1111111 0.0000000
[6,] 0.0000000 0.0000000 0.1111111
> cacheSolve(CachedMarix)
getting cached data
          [,1]      [,2]      [,3]
[1,] 0.1111111 0.0000000 0.0000000
[2,] 0.0000000 0.1111111 0.0000000
[3,] 0.0000000 0.0000000 0.1111111
[4,] 0.0000000 0.0000000 0.0000000
[5,] 0.0000000 0.0000000 0.0000000
[6,] 0.0000000 0.0000000 0.0000000
          [,4]      [,5]      [,6]
[1,] 0.0000000 0.0000000 0.0000000
[2,] 0.0000000 0.0000000 0.0000000
[3,] 0.0000000 0.0000000 0.0000000
[4,] 0.1111111 0.0000000 0.0000000
[5,] 0.0000000 0.1111111 0.0000000
[6,] 0.0000000 0.0000000 0.1111111
