# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
```

_Also design the interface of each class in more detail._

```ruby
class Scorecard
  def initialize
    total_score = 0
    @frame = frame
  end

  def add_frame_score(frame_score)
    return total_score += frame.frame_score
  end

end

class Frame
  def initialize(
    @frame_points = [])
  end

  def roll_one(pins)
    @frame_points << pins
  end

  def roll_two(pins)
    @frame_points << pins
  end

  def strike
    if @frame_points[0] == 10
      strike == true
    end
  end

  def spare
    if @frame_points.sum == 10
      spare == true
    end
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE


scorecard = Scorecard.new
frame = Frame.new
frame.roll_one(1) = 5
frame.roll_two(1) = 5
expect(scorecard.total_score).to eq 10


# If frame.roll_one(1) = 10 - strike
total_score += (frame.roll_one

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
