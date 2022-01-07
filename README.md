# Wordle Cracker

## Cracking the viral wordle games but with a gentle brute-force style.

When you are stuck in solving wordle games, and you are nerdy enough to help yourself through coding, 
the result looks like this.

Maybe, I will build a shiny app on this—we'll see.

## How to modify/use this template.

 1. Guess 2 or 3 times.
 2. Enter all "grey" characters/letters in the df of `stop_ch`
 3. Adjust the resampling chunk accordingly. That is, as soon as you solved "green" characters/letters, enter them in the string with the `%s` placeholders.
    The `%s`placeholders represent the unsolved charcaters/letters. At those positions, all possible letters (without the `stop_ch` characters) are resampled with replacement. 
 
 That's it. In the end, you will get a list of a few possible words (currently, including names and places).

Happy wordling!

That pattern that drove me crazy and why I had to use gentle brute force approaches: 

Wordle 201 5/6

  🟨⬛⬛⬛⬛\
  ⬛🟩⬛⬛⬛\
  ⬛🟩🟩⬛⬛\
  ⬛🟩🟩⬛⬛\
  🟩🟩🟩🟩🟩
