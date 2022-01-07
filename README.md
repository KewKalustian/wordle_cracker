# Wordle Cracker

When you are stuck in solving wordle games, and you are nerdy enough to help yourself through coding, 
the result looks like this.

## How to modify/use that script

 1. Guess 3 or 4 times. (If you guess less, you will have to add more placeholders and more sampling chunks).
 2. Enter all "grey" characters/letters in the `df` of `stop_ch`
 3. Adjust the resampling chunk accordingly. That is, as soon as you solved "green" characters/letters, enter them in the string with the `%s` placeholders.
    The `%s` placeholders represent the unsolved charcaters/letters. At those positions, all possible letters (without the `stop_ch` characters) are resampled with replacement. 
 
That's it. In the end, you will get a list of a few possible words (currently, including names and places).


That pattern that drove me crazy and why I had to use gentle brute force approaches: 

Wordle 201 5/6

  🟨⬛⬛⬛⬛\
  ⬛🟩⬛⬛⬛\
  ⬛🟩🟩⬛⬛\
  ⬛🟩🟩⬛⬛\
  🟩🟩🟩🟩🟩


Maybe, I'm going to build a shiny app on this—we'll see.

Happy "wordling"!
