# Bowling Multi-Class Planned Design Recipe

## 1. Describe the Problem


[See README.md](/README.md)

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

![Ten Pin Score Class System](class_diagram.png)

_Also design the interface of each class in more detail._

```ruby
class GameLibrary
  def initialize
    # ...
  end

  def add(roll) # roll is an instance of roll
    # Roll gets added to the library within a frame (array)
    # Returns nothing
  end

  def rolls_by_frame
    # Returns a list of roll objects within separate frames (array of arrays)
  end
  
end

class Roll
  attr_accessor :score
end

class ScoreCalculator
  def initialize(game)
    # initialise with game inst
  end

  def score_by_frame
    # Returns an array of score for each frame
  end

  def total_score
    # Returns int
  end
  
end

class FrameCounter
  def initialize(game)
    # initialise with game inst
  end

  def frame_total
    # Returns int
  end
  
end


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all 20 rolls separated within 10 frames where no strikes or spares are scored
game = GameLibrary.new
roll_1 = Roll.new(1)
game.add(roll_1)
roll_2 = Roll.new(2)
game.add(roll_1)
roll_3 = Roll.new(1)
game.add(roll_3)
roll_4 = Roll.new(2)
game.add(roll_4)
roll_5 = Roll.new(1)
game.add(roll_5)
roll_6 = Roll.new(2)
game.add(roll_6)
roll_7 = Roll.new(1)
game.add(roll_7)
roll_8 = Roll.new(2)
game.add(roll_8)
roll_9 = Roll.new(2)
game.add(roll_9)
roll_10 = Roll.new(2)
game.add(roll_10)
roll_11 = Roll.new(2)
game.add(roll_11)
roll_12 = Roll.new(2)
game.add(roll_12)
roll_13 = Roll.new(1)
game.add(roll_13)
roll_14 = Roll.new(2)
game.add(roll_14)
roll_15 = Roll.new(1)
game.add(roll_15)
roll_16 = Roll.new(2)
game.add(roll_16)
roll_17 = Roll.new(1)
game.add(roll_17)
roll_18 = Roll.new(2)
game.add(roll_18)
roll_19 = Roll.new(2)
game.add(roll_19)
roll_20 = Roll.new(2)
game.add(roll_20)
game.all # => [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2]]


```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


