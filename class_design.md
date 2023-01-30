# BowlingScorecard Class Design

## 1. Task

To create a program that takes user input and calculates the total score for a bowling game. 

The game consists of 10 frames

In each frame, a player has two opportunities to knock down all 10 pins. 

STRIKE -  a player knocks down all 10 pins in the first roll of a frame

SPARE - a player knocks down all 10 pins using two rolls

Strikes and spares are rewarded with bonuses that are dependent on successive rolls in the game. Hence, a frame's final score is effectively awarded retroactivly. 

The tenth frame may have up to 3 rolls 

## 2.  Class Interface



```ruby


class BowlingScorecard
  def initialize(rolls) # array of numbers representing pins knocked by each roll
  end

  def set_frames 
    # takes @rolls and calculates the length of each frame 
  end 

  def apply_bonuses
    # applies bonus scores to each frame wherein a player scored a strike or a spare
    
  end
  def total
    # returns the scorecard with added bonuses and the final total
  end

end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# 

# 1
scorecard = BowlingScorecard.new([1,2,3,4,5,1])
scorecard.set_frames # arr =[[1,2], [3,4], [5,1]]


# 2
scorecard = BowlingScorecard.new([10,2,5,5,1])
scorecard.set_frames # arr =[[10], [2,5], [5,1]]
scorecard.apply_bonuses # =>  [[17], [2,5], [5,1]]

# 3
scorecard = BowlingScorecard.new([10,2,5,5,1])
scorecard.set_frames # arr =[[10], [2,5], [5,1]]
scorecard.apply_bonuses # =>  [[17], [2,5], [5,1]]
scorecard.total # => 30
```
