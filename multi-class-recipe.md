# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a bowler
So I can record my game
I want to be able to note my scores for each frame

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────┐
│ Scorecard                  │
│ - @scorecard = []          │
│ - add(roll)                │
│ - scorecard_arr            │
│ - frame_score              │
│ - final_score              │
└───────────┬────────────────┘
            │
            │ owns a collection of frames
            ▼
┌─────────────────────────┐
│ Frame                   │
│                         │
│ - roll1                 │
│ - roll2                 |
│ - frame = []
│ - takes input from user |
│                         | 
└─────────────────────────┘


┌─────────────────────────┐
│ FormatScorecard         │
│                         │
│ - defines               │
│                         │
│                         │
│                         │
└─────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Scorecard
  def initialize
    # scorecard = []
  end

  def add(frame) # frame is an instance of Frame
    # Frame gets added to the scorecard
    # Returns nothing
  end

  def raw_score_arr
    # Returns an array of all frames so far
  end

  def spare_bonus
    # Looks for spare (/) from frame in raw_score_arr
    # Adds roll1 of frame n+1 to spare, returns to score_arr
  end

  def strike_bonus
    # Takes strike (X) from rolls_arr
    # Adds roll1 & roll2* of frame n+1, returns to scorecard_arr
    # If roll1 of frame n+1 is also a strike, adds roll1 of frame n+2
  end
  
  def score_arr
    # 
  end

  def final_score
    # Adds all scores from score_arr
    # returns final total
  end
end

class Frame
  def initialize(roll1, roll2)
  @roll1 = roll1
  @roll2 = roll2
  @frame = []
  end

  def roll1
    @roll1
  end

  def roll2
    @roll2
  end

  def add
    @frame << roll1, roll2
  end

  def frame_arr
    @frame
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Adds frames to raw_score_array
scorecard = Scorecard.new
frame1 = Frame.new('1', '6')
frame2 = Frame.new('6', '3')
scorecard.add(frame1)
scorecard.add(frame2)
scorecard.raw_score_arr # => [['1','6']['6']['3']]
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