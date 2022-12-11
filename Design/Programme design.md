
* 10 Frames

For each frame:
* Player has 2 attempts to knock down 10 pins
* Turn ends when player knocks down 10 mins or has had two attemps 

### Scoring:

#### Open Frame Scoring

"An open frame occurs if the bowler uses both of their rolls and fails to knock down all ten pins (0-9 pins were knocked down). henever this happens without a preceding spare or strike, the bowler will be awarded points equal to the number of pins they just knocked down."

#### Scoring after a spare

"When you bowl a spare, the value for that frame will be 10 plus the total pins knocked down on the next roll. For instance, after bowling a spare in the third frame, you knock down 7 pins on the first roll in the fourth frame—you will then add 17 to your running total in the third frame."

#### Scoring after a strike

When you bowl a strike, the value for that frame will be 10 plus the total pins knocked down on the next two rolls. That is why you get 30 when you bowl three strikes in a row, and also why a perfect game equals 300—a score of 30 is achieved for each of the 10 frames.

*In other words - the value for a strike is calculated for the next two rolls, regardless of the frame!* 

#### The final frame

"Scoring in the 10th frame is slightly different if you roll a spare or a strike. Since a spare is 10 plus the next roll, you get an extra roll if you score a spare in the 10th frame. If you bowl a strike with your first roll in the 10th frame, you get two more rolls so you can complete the score since a strike is 10 plus the next two rolls."

*the maximum score on the last frame is 30
*The value of the extra rolls you get in strike of spare is only added to your spare score, and not a score in of itself.


### Scenarios

### Open Frames and general scenarios

* Score must be between 0 - 10
  * Error raised otherwise

#### Spares

* Spare into open frame
  * Roll one of the next frame added to spare frame total
* Spare into strike 
  * Adds 10 to the spare frames score (frame total = 20)
* Spare into spare: 
  * Second spare doesnt matter - ONLY Roll 1 of the next frame does 
* Spare into gutter
  * 0 added to spare frame (10 total)

#### Strikes 

* Strike into open frame
  * adds total off the next two rolls to the strike frame score

* Strike into spare 
  * adds total off the next two rolls to the strike frame score 
  (strike only looks at rolls so spare doesnt matter)

* Strike into strike into open frame
  * Adds 10 + the value of the first roll of the open frame
  (strike only looks at score so strike modifier doesnt matter)
  
* Strike into strike into strike 
  * Adds each of the next two ROLLS is 10 so 20 is added to the frame, total modifiers dont apply

#### Final Frame

* Strike
  * grants TWO additional rolls, adds total of those rolls to frame 10 total (does not count as its own frame)

* Spare 
  * Grants ONE additional roll, adds total of that roll to frame 10. No extra roll if the third roll is a strike. 

### Initial Class outline

```Ruby

class Frame

  def initialize(first,second)

  # Score accumalator monitors score
  # First roll happens: 
    # If remaining pins = 0, frame ends, mark strike to true, end frame
    # Else add result to accumalator
  # Second roll happens: 
    #If remaining pins = 0, frame ends, mark spare to true
    #else add result to accumalator for the frame

# in the progamme:

  # method would take at most two arguments, one for each roll
    # If first argument = 10, dont expect second argument
      # Strike and spare caclulation would happen outside of class
  # Raise error if first + second > 10

  # If first = 10 set strike to 10, return X
  # If first + second = 10 set spare to true, return /
  # else return first + second 


  
  end 

  def frame_total

  def is_strike?

  # Mark strike for frame 

  end 

   def is_spare

  # Mark spare

  end 
end 


class Scorecard

  def initialize

  score = (:frame_one, :frame_two, :frame_three, :frame_four, :frame_five, :frame_six, :frame_seven, 
  :frame_eight, :frame_nine, :frame_ten)

  # @scorecard

  end 

  def total 

  # Return Scorecard

  end

  def add(frame)

  # add total for the frame
  # check if any unresolved strikes or spares that are effected by the roll
    # if so, amend results

  end




end 

```

### Test examples 

```Ruby 

# Score Unit tests:

  
  # 1 - Score must be between 0 - 10

    frame = Frame.new(1,5) 
    expect(frame.frame_total).to equal 6
    expect(frame.is_strike?).to equal false
    expect(frame.is_spare?).to equal false

  # 2 - Raises error if sum of frame arguments is > 20
    frame = Frame.New(10,5)
    expect(frame).to raise_error "invalid score"

  # 3 Frame is a spare

    frame = Frame.new(6,4) 
    expect(frame.frame_total).to equal 10
    expect(frame.is_strike?).to equal false
    expect(frame.is_spare?).to equal true

  # 4 Frame is a Strike 

    frame = Frame.new(10,0) 
    expect(frame.frame_total).to equal 10
    expect(frame.is_strike?).to equal true 
    expect(frame.is_spare?).to equal false

  # 5 Frame does not accept another roll after a strike 

    frame = Frame.new(10,5) 
    expect(frame).to raise_error "invalid score"

# Scorecard integration tests 

  # Spare functionality 

    # 1 - Scorecard correctly calculates a spare into an open frame

      scorecard = ScoreCard.new
      frame1 = Frame.new(6,4) 
      frame1_total = frame1.frame_total
      frame2 = Frame.new(5,2) 
      scorecard.add(frame1_total)
      scorecard.add(frame2_total)

      expected_scorecard = {
        frame_one: 15
        frame_two: 7
      }
      expect(scorecard.total).to include(expected_scoredcard)
      expect(frame1.is_spare?).to eq true

    # 2 - Scorecard correctly calculates a spare into a strike (in isolation)

      scorecard = ScoreCard.new
      frame1 = Frame.new(5,5) 
      frame1_total = frame1.frame_total
      frame2 = Frame.new(10,0) 
      scorecard.add(frame1_total)
      scorecard.add(frame2_total)

      expected_scorecard = {
        frame_one: 20
        frame_two: 10
      }
      expect(scorecard.total).to include(expected_scoredcard)
      expect(frame1.is_spare?).to eq true

    # 3 - Scorecard correct counts spare into spare (does not care about second spare no.2)

      scorecard = ScoreCard.new
      frame1 = Frame.new(5,5) 
      frame1_total = frame1.frame_total
      frame2 = Frame.new(6,4) 
      scorecard.add(frame1_total)
      scorecard.add(frame2_total)
      expected_scorecard = {
        frame_one: 16
        frame_two: 10
      }
      expect(scorecard.total).to include(expected_scoredcard)
      expect(frame1.is_spare?).to eq true

  # 4 - Spare into a gutter frame

    scorecard = ScoreCard.new
      frame1 = Frame.new(5,5) 
      frame1_total = frame1.frame_total
      frame2 = Frame.new(0,0) 
      scorecard.add(frame1_total)
      scorecard.add(frame2_total)
      expected_scorecard = {
        frame_one: 10
        frame_two: 0
      }
      expect(scorecard.total).to include(expected_scoredcard)
      expect(frame1.is_spare?).to eq true

# 1 - Strike into open frame

# 1 - Strike into open frame

# 1 - Strike into open frame

# 1 - Strike into open frame

# 1 - Strike into open frame

# 1 - Strike into open frame

# 1 - Strike into open frame

# 1 - Strike into open frame

# 1 - Strike into open frame

# 1 - Strike into open frame



```
