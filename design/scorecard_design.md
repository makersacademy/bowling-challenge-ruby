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

```
┌────────────────────────────┐
│ Scorecard                  │
│                            │
│ - add(frame)               │
│ - score                    │
└───────────┬────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Frame                   │
│                         │
│ - play(first,second)    │
│ - is_strike?            │
│ - is_spare?             │
│                         │
└─────────────────────────┘
```



## 2. Design the Class Interface

```ruby

class Frame 
 

  def roll(first, second) # first and second are both integers
    
    # score accumulator keeps track of rolls 
 
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

  def total
    # returns an integer of the total score from each frame that has been added
  end 

  def add(frame) # frame is a string
    # takes one agument - and instance of Frame 
    # adds the score of frame to a scorecard 
    # returns nothing 
  end 

end 
```


## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# 1. adds a frame to the scorecard
score = ScoreCard.new
frame_1 = Frame.new
frame_1.roll(3,4)

score.add(frame_1)
expect(score.total).to eq 7

# 2. adds multiple frames to the scorecard
score = Scorecard.new
frame_1 = Frame.new
frame_2 = Frame.new
frame_1.roll(3,4)
frame_2.roll(1,3)

score.add(frame_1)
score.add(frame_2)
expect(score.total).to eq 11

# 3. adds a strike to the scorecard
score = Scorecard.new
frame_1 = Frame.new
frame_2 = Frame.new
frame_1.roll(10)
frame_2.roll(1,3)

score.add(frame_1)
expect(score.total).to eq 14

# 4. adds multiple scores including a spare to the scorecard
score = Scorecard.new
frame_1 = Frame.new
frame_2 = Frame.new
frame_1.roll(3,7)
frame_2.roll(1,7)

score.add(frame_1)
score.add(frame_2)
expect(score.total).to eq 19

# 5. returns error if score total requested but full number of rolls required have not been played 
score = Scorecard.new
frame_1 = Frame.new
frame_1.roll(10)

expect { score.add(frame_1) }.to raise_error "strike requires two more rolls for your bonus"



```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# For Frame

# 1. it initiates a new instance of frame 
frame = Frame.new

# 2. it keeps a score for that frame 
frame = Frame.new
expect(frame.play(1,2)).to eq 3

# 3. it recognises if strike
frame = Frame.new
frame.play(10)
expect(frame.is_strike?).to eq true 

# 4. it recognises if spare
frame = Frame.new
frame.play(1,9)
expect(frame.is_strike?).to eq false 
expect(frame.spare).to eq true 

# 5. it raises error if rolls do not sit within range 0 - 10 
frame = Frame.new
expect { frame.play(1,10) }.to raise_error "you cannot knock down more than ten pins in a frame"

# 6. it raises error if first roll < 10 and second roll is empty
frame = Frame.new
expect { frame.play(6) }.to raise_error "need to enter a second roll value"

# for Scorecard

# 1. it initially returns a score of 0 
score = Scorecard.new
expect(score.total).to eq 0 

# 2. it returns error if frame added that does not exist
score = Scorecard.new
expect { score.add(frame) }.to raise_error "frame does not exist"





# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->