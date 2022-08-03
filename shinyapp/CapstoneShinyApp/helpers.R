

predict <- function(input) {

    # predict something only if input numnber of words is 1 or more and return nothing otherwise
    number_words_input <- length(strsplit(input, " ")[[1]])
    if (number_words_input == 0) {
      return("")
    } else {
      return(paste("prediction", "", number_words_input))
    }
}

