{{BOWLING CHALLENGE}} Multi-Class Planned Design Recipe
1. Describe the Problem
To create a bowling scorecard program which counts and sums the scores of bowling game for one player

2. Design the Class System


class Game
  def initialize
    @scores = []
  end

  def add(frame) # frame is an instance of Frame
    # Frame gets added to the total_score array, if frame is closed
    # Returns nothing
  end

  def score_card
    # Returns a list of frame scores
  end
  
  def sum_total 
    # sums the total of @scores
    # Returns total
  end
end

class Frame
  def initialize 
  @rolls = []
  @closed = false
  @pins_left = 10
  @roll_counter = 0
  @roll_score = 0
  end

  def roll(pins)
    # pins is number of pins knocked down in a roll
    add pins to @rolls
    @roll_counter += 1
    @pins_left = @pins_left - pins
  end

  def frame_score
    # list of scores
  end

  def frame_total
    # add together frame scores

  def strike
    # rolls 10 on first go
  end

  def spare
    # total 10 in 2 rolls
  end

  def closed?
    # changes closed to true if strike or spare or 2 rolls

  end

  def bonus
    
end

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# EXAMPLE

# Gets list of frame scores
game = Game.new
frame_1 = Frame.new
frame_2 = Frame.new
game.add(frame_1)
game.add(frame_2)
game.score_card # => [frame_1, frame_2]

# Sums the total of frame scores
game = Game.new
frame_1 = 7
frame_2 = 8
game.add(frame_1)
game.add(frame_2)
game.sum_total # => 15

# Knows when frame is closed
game = Game.new
frame_1 = 10
frame.closed? => true
game.sum_total # => 10

4. Create Examples as Unit Tests

# Constructs a frame
frame = Frame.new
@rolls = []

# Records a roll
frame = Frame.new
frame.roll(3)
frame.frame_score => [3]

# Records two rolls, no strike or spare
frame = Frame.new
frame.roll(4)
frame.roll(5)
frame.frame_score => [4, 5]

# Records a strike and closes frame
frame = Frame.new
frame.roll(10)
frame.closed? => true

# Records a spare and closes frame
frame = Frame.new
frame.roll(6)
frame.roll(4)
frame.closed? => true

(need to add on bonus for strike and spare) 

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.