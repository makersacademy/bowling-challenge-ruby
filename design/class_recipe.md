
# Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
I want to be able to see
a scorecard of my bowling game
for one player

As a user
I want to see results
frame by frame in a 10 
frame game of bowling 

As a user 
I will inputthe score of each roll,
of each frame 

As a user
I want to see a running
total score of all the points
I have total frame by frame

As a user
I want to acurrately
calcuate a strike so I get 
10 points for knocking down all pins
and x amount of extra points, x being
the number of pins knocked down in the
BOTH rolls of next frame

As a user
I want to acurrately
calcuate a spare 10 points for knocking down all pins
over two rolls, and x amount of extra points, x being
the number of pins knocked down in the
FIRST roll of next frame

As a user
if i roll a strike on the tenth frame
i want to be able to roll twice more
for my bonus points

As a user
if I roll a spare on the tenth frame
i want to be able to roll once more
for my bonus points

## 2. Design the Class System

nouns:

frame, scorecard, points, rolls, strike, spare, tenth frame, bonus points

```ruby

class Frame
  def initialize(io)
    @io = io
    @final = []
  end

  def start_frame
    first_roll = roll(1)
    if first_roll == 10
      @final << first_roll, 'X'
      return @final
    else
      second_roll = roll(2)
      @final << first_roll, second_roll
      return @final
    end
  end

  def roll(roll_number)
    @io.puts "Roll #{roll_number} - enter number of pins knocked down"
    pins_knocked_down = @io.gets.chomp.to_i
    return pins_knocked_down
  end

  def strike?
    @final.first == 10
  end

  def spare?
    !strike? && @final.sum == 10
  end

  def final
    return @final
  end
end


class ScoreCard
  def initialize 
    @frame_count = 0
    @all_frames = []
  end

  def frame_input(frame)
    if @frame_count == 9
      return tenth_frame
    else
      @all_frames << frame.final
      @frame_count += 1
      return "#{10 - @frame_count} frames left"
    end
  end

  def calculate_total

  end

  def tenth_frame

  end

  def final_format
    return "Your game isn't over yet!" if @frame_count < 10
  end
  
  private

  def spare_bonus_roll

  end

  def stike_bonus_rolls

  end
end
```

## 3. Create Examples as Integration Tests

```ruby
RSpec.describe 'integration' do
  context 'Inputting a Frame' do
    it 'correctly inputs one Frame object into the total array' do
    
    end
  end
end
```

## 4. Create Examples as Unit Tests

Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail.

Encode one of these as a test and move to step 5.

## 5. Implement the Behaviour

For each example you create as a test, implement the behaviour that allows the
class to behave according to your example.

Then return to step 3 until you have addressed the problem you were given. You
may also need to revise your design, for example if you realise you made a
mistake earlier.

Copy and fill out [this template](../resources/multi_class_recipe_template.md)
for each of the below exercises.

## Demonstration

[A video demonstration](https://www.youtube.com/watch?v=CkyhW3pNTUY&t=0s)
