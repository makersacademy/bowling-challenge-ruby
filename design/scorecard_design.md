#  Bowling Game Design 

# SCORING SYSTEMS 

A bowling game consists of ten 'frames'. Each frame consists of two rolls, apart form the final frame (10) which has three rolls.

The score accumulates throughout the game. 
A gutter roll is when no pins are knocked down in a roll. 

For each frame, there can be three scoring scenarios: standard, strike and spare. 


# 1. Standard scoring
Standard scoring works as follows: 
A player's score per frame is calculated by the number of pins they knock down across the two rolls of their frame. 

eg. roll 1  = 4 pins knocked down 
    roll 2  = 2 pins knocked down 

    frame score = 6

The score accumulates from frame to frame as the game progresses.

eg. if frame 1 scores 6 and another 3 pins are knocked down in frame 2, the score at frame 2 will be 9. 

# 2. Strike
A strike occurs when all ten pins are knocked down in the FIRST roll of a frame. 
When this happens, a player is give a base score of 10 PLUS a bonus score which is taken from the number of pins knocked down in the TWO rolls of the FOLLOWING frame. 

The maximum score for a strike would be 30 (a strike in the first frame followed by two strikes in the second frame. 10 + 10 + 10 = 30 )

The minimum score for a strike would be 10 (a strike in the first frame followed by two gutter rolls in the second frame. 10 + 0 + 0  = 10 )

# 3. Spare 
A spare is awarded when it takes two rolls to knock down all the pins in a frame. 
When this happens, a player is given a base score of 10 PLUS a bonus score which is taken from the number of pins knocked down in the the FIRST roll of the FOLLOWING frame. 

The maximum score for a spare is 20 (a spare in the first frame followed by a strike in the first roll of the second frame (10 + 10 = 20))
 
# final frame (10th)
For the final frame there are 3 rolls. Strike and spare bonus points still work - althought the bonus rolls all take place within the same frame. As usual there is a maximum score of 30 available. 


--------------------------------------------------------

# BowlingGame Class Design Recipe


## 2. Design the Class Interface


```ruby

class Frame 
 

  def roll(first, second)
    
    # score accumulator keeps track of rolls 

    # play first roll 
    # if first roll = 10, end frame and mark is_strike? as true
      # score is 10 + the two scores from the following frame
    # else add score to score accumulator 

    # play second roll
      # if sum first and second roll = 10, mark is_spare? as true 
        # score is 10 plus first roll of following frame
      # else add score to score accumulator  
    
  end

  def is_strike? 
    # marks if strike
  end 

  def is_spare?
    # marks if spare
  end 

end

class ScoreCard

  def initialize
    total_score = [:frame_one, :frame_two, :frame_three, :frame_four, :frame_five, :frame_six, :frame_seven, :frame_eight, :frame_nine, :frame_ten]
  end 

  def score
    # returns an integer of the total score from each frame that has been added
  end 

  def add(frame)
    # takes one agument - and instance of Frame 
    # adds the score of frame to a scorecard 
    # returns nothing 
  end 

end 
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1 
it "creates a new instance of the game" do 
  player_1 = BowlingGame.new
end 

# 2 
it "initially returns an empty score" do 
  player_1 = BowlingGame.new  
  player_1.score #=> 0
end 

#3 
it "returns a score of 21 if 





# 1
reminder = Reminder("Kay")
reminder.remind_me_to("Walk the dog")
reminder.remind() # => "Walk the dog, Kay!"

# 2
reminder = Reminder("Kay")
reminder.remind() # fails with "No task set."

# 3
reminder = Reminder("Kay")
reminder.remind_me_to("")
reminder.remind() # => ", Kay!"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->