Bowling Challenge in Ruby
=================

This program calculates and returns the score of a bowling game for one player.

## Files

```
./lib/bowling_score.rb
```

## User Stories

```
As a player,
So I don't have to remember all my scores,
I want to be able to save my scores into a computer.

As a player,
So I get the full points for a Strike,
I want the bonus points for a Strike calculated correctly.

As a player,
So I get the full points for a Spare,
I want the bonus points for a Spare calculated correctly.
```
## Functionality

* The program works by saving the score of each roll to an array
* When calculating the total score, the program iterates through each roll, checking for strikes and spares, and adding bonus points accordingly, and returning the final score at the end
