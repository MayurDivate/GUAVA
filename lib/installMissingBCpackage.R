args = commandArgs(trailingOnly=TRUE)

checkBCpackage <- function(bcpkgname){ 
  c <- suppressMessages(suppressWarnings(library(bcpkgname,character.only = TRUE,logical.return = TRUE,quietly = TRUE)))  

    if(!c){
      suppressMessages(source("https://bioconductor.org/biocLite.R"))
      suppressMessages(biocLite(suppressAutoUpdate=TRUE,ask = FALSE,suppressUpdates = TRUE))
      suppressMessages(biocLite(bcpkgname))
    
      c2 <- suppressMessages(library(bcpkgname,character.only = TRUE,logical.return = TRUE,quietly = TRUE))  

      if(!c2){
        return(FALSE)
        }
      else{
        return(TRUE)
      }
    }
    return(TRUE)
}

checkBCpackage(args[1])

