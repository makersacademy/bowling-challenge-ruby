# Bowling Class Design Recipe

## 1. Describe the Problem

As a user
So that I can see my final score
I want to calculate the points scored in all 10 frames, including any bonuses

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
class Bowling
  def initialize
    @score = 0
    @current_frame = 1
    @bonus_roll = 0
  end

  def process_frame(rolls) # rolls is an integer
  # throws an error if frame > 10
  # calculates the number of points for each frame, including 1 or 2 rolls and bonuses
  # it does not return anything
  end

  def report_score(score) # score is an integer
  # returns a string with the player's final score
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
bowling = Bowling.new
bowling.process_frame([1, 4])
bowling.process_frame([4, 5])
bowling.process_frame([6, 4])
bowling.process_frame([5, 5])
bowling.process_frame([10, 0])
bowling.process_frame([0, 1])
bowling.process_frame([7, 3])
bowling.process_frame([6, 4])
bowling.process_frame([10, 0])
bowling.process_frame([2, 8, 6])
expect(bowling.report_score).to eq "You scored 133 points!"

# 2
bowling = Bowling.new
bowling.process_frame([10]) # 10 + 2*extra_throw = 30
bowling.process_frame([10]) # 30 + 10 + 2*extra_throw = 60
bowling.process_frame([10]) # 60 + 10 + 2*extra_throw = 90
bowling.process_frame([10]) # 90 + 10 + 2*extra_throw = 120
bowling.process_frame([10]) # 120 + 10 + 2*extra_throw = 150
bowling.process_frame([10]) # 150 + 10 + 2*extra_throw = 180
bowling.process_frame([10]) # 180 + 10 + 2*extra_throw = 210
bowling.process_frame([10]) # 210 + 10 + 2*extra_throw = 240
bowling.process_frame([10]) # 240 + 10 + 2*extra_throw = 270
bowling.process_frame([10, 10]) # 270 + 10 + 10 1*extra_throw = 300
expect(bowling.report_score).to eq "Congratulations on your perfect game! You scored 300 points!"

# 3
bowling = Bowling.new
bowling.process_frame([0, 0])
bowling.process_frame([0, 0])
bowling.process_frame([0, 0])
bowling.process_frame([0, 0])
bowling.process_frame([0, 0])
bowling.process_frame([0, 0])
bowling.process_frame([0, 0])
bowling.process_frame([0, 0])
bowling.process_frame([0, 0])
bowling.process_frame([0, 0])
expect(bowling.report_score).to eq "Game over, you scored 0 points."
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
