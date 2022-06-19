# Bowling Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a bowler
So that I can find out if I won the game
I want to see my total score at the end of game

As a bowler
So that I can see how many point I scored in a frame
I want to see my total score after each frame

As a bowler
So that I can see how well I played
I want to see how many strike and spares I scored at the end of a game


## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class Bowling
  def initialize
    # ...
  end

  def frames(frame) #frame is an integer, that come from the users input
  # no return values     
  end

  def rolls(roll, pins) #roll and pins an integer, that come from the users input
   # no return values 
  end 

  def frame_score
  #  no return values 
  end

  def total_score
  # return sum of total_score array
  # return string - "Your current score is x"
  end

   def spare
  # return nothing - if no spares in that frame
  # return string - "Well Done! You scored a spare!" 
  end

  def strike
  # return nothing - if no strikes in that frame
  # return string - "Well Done! You scored a strike! Play your next frame to find out your total score"
  # push counter into array
  end

  def tenth_frame
  # return total score 
  # return string - "Good Game! You scored a total of x points!"
  # return number of strkes
  # return number of spare
  # return string - " You scored x strikes and x spares"
  end 

  def report
  # return current frame 
  # return current roll
  # return current frame score
  end 
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1 - test user input is turned into frame variable and added to frame array
let(:frame) {'1'}
game = Bowling.new
game.frames(frame)
game.report
expect(game.report).to eq "You just played frame: 1"

# 2 - test frames, roll, report method 
let(:frame) {'1'}
let(:roll) {'1'}
let(:pins) {'5'}
game = Bowling.new
game.frames(frame)
game.rolls(roll, pins)
game.frame_score
game.report
expect(game.report).to eq "You just played frame: 1. You have just played roll: 1. You just scored 5 points"

# 3 - test frames, roll, frame_score and report method - 2 rolls in one frame
let(:frame) {'1'}
let(:roll_1) {'1'}
let(:pins_1) {'7'}
let(:roll_2) {'2'}
let(:pins_2) {'2'}
game = Bowling.new
game.frames(frame)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.frame_score
game.report
expect(game.report).to eq "You just played frame: 1. You have just played roll: 2. You scored 9 points in this frame."

# 4 - test frames, roll, frame_score and total_score - 2 rolls in one frame
let(:frame) {'1'}
let(:roll_1) {'1'}
let(:pins_1) {'7'}
let(:roll_2) {'2'}
let(:pins_2) {'2'}
game = Bowling.new
game.frames(frame)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.frame_score
game.total_score
expect(game.total_score).to eq "Your current score is 9"

# 5 - test frames, roll, frame_score and total_score - 1 frames, 2 rolls, 1st frame = spare
let(:frame_1) {'1'}
let(:roll_1) {'1'}
let(:pins_1) {'8'}
let(:roll_2) {'2'}
let(:pins_2) {'2'}

game = Bowling.new
game.frames(frame_1)
game.rolls(roll_1, pins_1)
game.spare
game.frame_score
game.total_score
expect(game.spare).to eq "Well Done! You scored a spare!"
expect(game.total_score).to eq "Your current score is 18" # (10+8)



# 6 - test frames, roll, frame_score and total_score - 4 rolls, 2 frames
let(:frame_1) {'1'}
let(:roll_1) {'1'}
let(:pins_1) {'4'}
let(:roll_2) {'2'}
let(:pins_2) {'2'}

let(:frame_2) {'2'}
let(:roll_1) {'1'}
let(:pins_1) {'5'}
let(:roll_2) {'2'}
let(:pins_2) {'4'}
game = Bowling.new
game.frames(frame_1)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.frames(frame_2)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.frame_score
game.total_score
expect(game.total_score).to eq "Your current score is 15"


# 7 - test frames, roll, frame_score, strike and total_score - 2 frames, 3 rolls, 1st frame = strike
let(:frame_1) {'1'}
let(:roll_1) {'1'}
let(:pins_1) {'10'}

let(:frame_2) {'2'}
let(:roll_1) {'1'}
let(:pins_1) {'5'}
let(:roll_2) {'2'}
let(:pins_2) {'4'}
game = Bowling.new
game.frames(frame_1)
game.rolls(roll_1, pins_1)
game.strike

game.frames(frame_2)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.frame_score
game.total_score
expect(game.strike).to eq "Well Done! You scored a strike! Play your next frame to find out your total score"
expect(game.total_score).to eq "Your current score is 28" # (10+5+4)+(5+4)

# 8 - test frames, roll, frame_score, strike and total_score - 2 frames, 4 rolls, 2nd frame = spare
let(:frame_1) {'1'}
let(:roll_1) {'1'}
let(:pins_1) {'4'}
let(:roll_2) {'2'}
let(:pins_2) {'3'}

let(:frame_2) {'2'}
let(:roll_1) {'1'}
let(:pins_1) {'5'}
let(:roll_2) {'2'}
let(:pins_2) {'5'}
game = Bowling.new
game.frames(frame_1)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.spare

game.frames(frame_2)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.frame_score
game.total_score
expect(game.spare).to eq "Well Done! You scored a spare!"
expect(game.total_score).to eq "Your current score is 22" # (4+3)+(10+5)

# 9 - complete a whole game, scoring no spares and strikes (need to do doubles for 10 frames)
let(:frame_1) {'1'}
let(:roll_1) {'1'}
let(:pins_1) {'4'}
let(:roll_2) {'2'}
let(:pins_2) {'3'}

let(:frame_2) {'2'}
let(:roll_1) {'1'}
let(:pins_1) {'5'}
let(:roll_2) {'2'}
let(:pins_2) {'5'}
game = Bowling.new
game.frames(frame_1)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)

game.frames(frame_2)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.frame_score

game.tenth_frame
expect(game.tenth_frame).to eq "Good Game! You scored a total of x points!"


# 9 - complete a whole game, scoring 1 spare and 1 strike (need to do doubles for 10 frames)
let(:frame_1) {'1'}
let(:roll_1) {'1'}
let(:pins_1) {'4'}
let(:roll_2) {'2'}
let(:pins_2) {'6'}

let(:frame_2) {'2'}
let(:roll_1) {'1'}
let(:pins_1) {'10'} # strike

let(:frame_3) {'3'}
let(:roll_1) {'1'}
let(:pins_1) {'5'}
let(:roll_2) {'2'}
let(:pins_2) {'2'}

game = Bowling.new
game.frames(frame_1)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.spare

game.frames(frame_2)
game.rolls(roll_1, pins_1)
game.strike


game.frames(frame_3)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.frame_score
game.tenth_frame
expect(game.spare).to eq "Well Done! You scored a spare!"
expect(game.strike).to eq "Well Done! You scored a strike! Play your next frame to find out your total score"
expect(game.tenth_frame).to eq "Good Game! You scored a total of x points!"


# 9 - complete a whole game, scoring no points
let(:frame_1) {'1'}
let(:roll_1) {'1'}
let(:pins_1) {'0'}
let(:roll_2) {'2'}
let(:pins_2) {'0'}

let(:frame_2) {'2'}
let(:roll_1) {'1'}
let(:pins_1) {'0'}
let(:roll_2) {'2'}
let(:pins_2) {'0'}
game = Bowling.new
game.frames(frame_1)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)

game.frames(frame_2)
game.rolls(roll_1, pins_1)
game.rolls(roll_2, pins_2)
game.frame_score
game.tenth_frame
expect(game.tenth_frame).to eq "Good Game! You scored a total of 0 points!"


# error tests
# if more than 2 frames with the same number
# if user enters roll 1 when already done role 1 

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._