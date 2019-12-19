#' Homer Ready Txt
#'
#' This function takes a bed formatted file and creates HOMER annotation ready txt on MAC
#' @param bed bed formated file, first three column should be: chr, start, end , ... 
#' @param filename either a character string naming a file or a connection open for writing
#' @return None
#' 
#' @examples
#' bed_to_homer("path/to/file", "path/to/save")
#' 
#' @export

bed_to_homer <- function(bed, filename){

  options(scipen=999) # prevent scientific notation because it may cause problems.
  meta <- bed [,c(1:3)]
  if (nrow(meta) <= 0) {
      stop("Couldn't parse bed file!")
  }
  if (length(grep("[A-Za-z]", meta[,1])) == 0 ){ #check if includes chr
    meta[,1] <- paste0("chr", meta[,1]) 
  }
  chrList <- list()
  uniqueID <- list()
  counter <- 0 # this code is really bad. I am sorry!
  for (col in as.character((unlist(meta[,1])))){
    
    if (is.null(chrList[[(col)]])){
      chrList[[(col)]] <- 1
    } else {
      chrList[[(col)]] <- chrList[[col]] + 1
    }
    counter <- counter + 1
    uniqueID[[counter]] <- chrList[[(col)]]
  }
  
  tbl <- meta %>% mutate(Strand = ".", UniqueID=paste0(CHR,"-",uniqueID %>% unlist)) %>% 
    select(UniqueID, everything())
  write.table(x = tbl, file = filename,
              sep = "\t", row.names = FALSE,quote= FALSE, col.names = TRUE)
}
