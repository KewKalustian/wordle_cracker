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

# browser search of the bingo words arranged in desc. order according to the most searched word (in bing)
url <- sprintf(
  "https://www.bing.com/search?q=%s", as.character(bingo_words_options$words)
)

browse_stats <- function(x){
  
 bingo_words <- x %>% 
                substring(nchar(.)-4, nchar(.))

 bing_browser_search_res <- html_text(html_nodes(read_html(x),".sb_count")) %>%
                                str_remove_all("[:punct:]") %>% 
                                str_remove_all("[:alpha:]") %>% 
                                as.numeric()
 
stats <- data.frame(bingo_words, bing_browser_search_res )
return(stats)
}  

map_df(url, browse_stats) %>% 
  arrange(desc(bing_browser_search_res))

