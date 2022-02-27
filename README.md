Bowling Challenge in Ruby
=================

I decided to approach this challenge by attempting to replicate how a bowling scoring card would actually look like in order to be able to more easily display if this was needed. This is why I decided to store the rolls in a 2d Array which I also think was the easiest way to track the scores.

I did end up having to `flatten` the array back into a 1d array when calculating the score due to the fact that consecutive strikes would be hard to score in a 2d array, I wanted to avoid bloating the program with multiple if else conditions.

## Example of how adding rolls works

```
game = BowlingGame.new
game.add_roll(4)
game.add_roll(5) 
```
This would create an entry in the 2d array for the first frame --> `[[4,5]]`
```
game.add_roll(10) 
```
Strikes instantly create a new entry --> `[[4,5],[10]]`

## Calculating score

In order to calculate the score I flattened the 2d array back into a 1d array and used a index which is tracked indepently to tally all the points properly.

For example if we have a scorecard --> `[[10],[4,5]]` it would transform into `[10,4,5]` and from here since we rolled a strike we would add the two values following the strike to tally the score for that frame (19).

This gives us flexibility when it comes to calculating multiple strikes and a perfect game (12 strikes).
