 makeCacheMatrix <- function(x = matrix()) # argument is a matix
   inver <- NULL # inver will hold value of matrix inverse. initially set to Null 
   set <- function(y) {# define the set function to assign new 
       x <<- y        #value of matrix in parent environment
       inver <<- NULL # if new matrix, reset inver to NULL                     
     }
   get <- function() x # define the get fucntion: returns value of the matrix argument
   setinverse <- function(inverse) inver <<- inverse  # assigns value of inv in parent environment
   getinverse <- function() inver #get value of inverse when called 
   
     list(set = set, get = get, setinverse = setinverse, getinverse = getinverse) # needed to refere to function with the dollar operator $
      
 ############### # This function computes the inverse of the  matrix returned by makeCacheMatrix  defined above
   cacheSolve <- function(x, ...) {
      inver <- x$getinverse()
      if(!is.null(inver)) {
           message("getting cached data")
          return(inver)
      }
     data <- x$get()
     inv <- solve(data, ...)
      x$setinverse(inver)
      inver
   }
   # If the   matrix has not changed and inverse has already been calculated then cacheSolve will retrieve the inverse from the cache
 
    ####test########
 y<-matrix(c(1,0,0,1),2,2)
 solve(y)
 
 x<-matrix(c(2,2,0,1),2,2)
 solve(x)
 
