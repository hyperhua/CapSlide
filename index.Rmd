---
title       : Predict a Next Word 
subtitle    : based on 3-gram database
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, selfcontained, draft}
knit        : slidify::knit2slides
---

## Goal

1. Goal: Give a next word suggestion based on your typing 
2. This is a simplified version: generated based on 0.1% corpus samples 
3. With 3-gram and 2-gram database searching

--- .class #id 

## Notations

1. Suppose you typed in a sequence of words (that is: (n-1) word-sequencing)
2. Typed in words were noted as: w_1, w_2, ... , w_(n-1) 
3. We would like to determine which is the word w_n, where w_n had the highest probability

P(w_n|w_(n-1), w_(n-2), ... , w_2, w_1) 

across choices of w_n.


--- .class #id 

## Unsmoothed N-gram model

1. A note that, in the Quiz 2 & 3, the word w_n is pick-a-winner from a list of four choices
2. However, in this shiny app, the word w_n is a free text choice, which we used different algorithms to determine the next word between the Quiz and shinny demo.
3. Algorithm: 

 a. Start from 3-gram database, search w_3|(w_2, w_1)
 
 b. If there is a match list in step a., then  the choice of w_3 is the word with the highest probability among those matched list. If rank 1 choice occurred in multiple words, we just simply chose the 1st one on the list but this could be easily implemented for looking at an upper n-gram database.
 
 c. If there is no match list in step a. Repeat step a. with n = 2. If no words were searched, the result is 'unfound'.

--- .class #id 



## Remark

1. The algorithm is strongly depend on the calling corpus database.
2. The higher n-gram model started, the higher accuracy for a next word suggestion
3. No correlations were considered between the previous sequencing words and the next predicted word
