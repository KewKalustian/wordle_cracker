# Example for: Wordle 201
# Target word: "banal"


library(tidyverse)
library(lexicon)

# already used characters in previous guesses
stop_ch <- data.frame(letters = c("r" , "o" , "w" , "t", "h" , "s" , "m" , "d" ,
                         "c", "e" , "n", "y" , "x" , "z"))

# saving all remaining characters into an object
possible <- anti_join(tibble(letters), stop_ch, by = "letters")

# resampling
set.seed(42, sample.kind = "Rounding")

resamp_word_options <-  replicate(10e4, {
  
  word = sample(sprintf(
    # already solved "- a n - -"
    "%san%s%s",
    sample(possible$letters, length(possible$letters), replace = T),
    sample(possible$letters, length(possible$letters), replace = T),
    sample(possible$letters, length(possible$letters), replace = T)
  ), 1)
})

# extracting all distinct words 
suggestions <- resamp_word_options %>% data.frame() %>%
  rename(., words = .) %>% 
  distinct()

# loading a word list
test <- grady_augmented

foo <- data.frame(words = test)

# saving only all "suggestions" that are also in the "foo" word list
bingo_words_options <- semi_join(suggestions, foo, by = "words")

# result
print(bingo_words_options)
