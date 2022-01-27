import pandas as pd
import numpy as np
import string as str

# already used characters in previous guesses
stop_ch = pd.DataFrame({"letters":[
 
"t","i",
"n","g",
"s","m",
"e",
"i",
"r"] 
 })

abc = pd.DataFrame({'letters': list(str.ascii_lowercase)})

# saving all remaining characters into an object

possible =  (
    stop_ch.merge(abc, 
              on = "letters", 
              how = "outer", 
              indicator=True)
    .query("_merge != "both" ")
    .drop(columns="_merge")
)
