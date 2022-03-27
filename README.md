# Bowling Challenge - Ruby

Our weekend challenge for the fifth week of the Makers Academy boot camp was to write a program that calculates the score of a bowling game, with a view to trying the same again in JavaScript. We were not tasked with fleshing it out into a playable game with a user interface, so I kept it very streamlined.

## My Approach

* I initially attempted to store the scores as a multidimensional array of ten frames with two scores each, but this added an extra layer of complication to I started again with my array holding 20 individual scores

* My first test was for a gutter game (0 on every roll) as this was the simplest application of what was to come - this drove the creation of game.roll and game.score methods, the latter of which placated RSpec with a hard-coded 0 in the method

* Testing the effects on the score by rolling 1 for every turn drove the creation of my class-level array for storing the scores

* Although it was tempting to use the .sum method on this array to total the scores, I decided against this approach with an eye on incrementing the turn value in order to implement bonuses for spares and strikes

* At first I gave my score method a `20.times` block adding each value stored in the @rolls array to the total, incrementing the turn by one , and returning the total after this block, but by the time I implemented functionality for strikes I had to use an if/elsif/else construction to account for incrementations of one for a strike (as a strike means the frame is only one roll) and two otherwise

## Possible Improvements

This program doesn't provide a running total, so it's only able to calculate the score for an entire game in retrospect with each roll inputted manually (although it does this accurately, and accounting for bonuses). Developing this into a user-friendly game would necessitate 'live' score updates, so this would be the first improvement I'd make. I'd also prefer to have the scores stored by frame, rather than individually.

[Jonny Abrams](https://github.com/jonnyabrams)
