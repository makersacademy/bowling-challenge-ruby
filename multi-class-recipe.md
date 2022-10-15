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
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Roll                    │
│                         │
│ - roll                  │
│ - user interaction      │
│ - takes input from user │
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
    # ...
  end

  def add(roll) # roll is an instance of Roll
    # Roll gets added to the scorecard
    # Returns nothing
  end

  def rolls_arr
    # Returns an array of all rolls
  end

  def spare_multiplier
    # Takes spare (/) from rolls_arr
    # Adds next score to spare, returns to score_arr
  end

  def strike_multiplier
    # Takes strike (X) from rolls_arr
    # Adds next two scores to spare, returns to score_arr
  end
  
  def score_arr
    
  end

  def frame_score
    # Sequentially takes 2 scores from score_arr
    # Returns the total score of each score
  end

  def final_score
    # Adds all scores from score arr
    # returns final total
  end
  
  # def search_by_title(keyword) # keyword is a string
  #   # Returns a list of tracks with titles that include the keyword
  # end
end

class FormatScorecard
  def initialize(xx,xx) # title and artist are both strings
  end

  def format_frame
    # Returns a string of the form "TITLE by ARTIST"
  end

  def format_final_score
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
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