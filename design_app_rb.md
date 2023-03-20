# Bowling Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user, I want to be able to keep track of my score while playing a game of bowling. 

When I start the program, I want to be prompted to enter the number of pins I knocked down on each throw of each frame, and I want the program to calculate my score and display it on a scorecard.

If I knock down all ten pins on my first throw of a frame, I want the program to automatically record a strike and move on to the next frame. If I knock down all ten pins on the second throw of a frame, I want the program to record a spare and move on to the next frame.

If I do not knock down all ten pins on a frame, I want the program to record an open frame and move on to the next frame.

When I reach the 10th frame, I want the program to allow me to make up to three throws if necessary, and to correctly calculate my score based on the number of pins knocked down in each throw.

At the end of the game, I want the program to display my total score and ask me if I want to start a new game or exit the program.

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

(diagram for classes in a separate file)

_Also design the interface of each class in more detail._

```ruby
class Application
  def initialize
    # new instance of Game class
    # new instance of Scorecard class
  end

  def start 
    # puts "Start game"
    # loop
  end

#   def all
    # Returns a list of track objects
#   end
  
#   def search_by_title(keyword) # keyword is a string
    # Returns a list of tracks with titles that include the keyword
#   end
end

class Frame
  def initialize(title, artist) # title and artist are both strings
  end

#   def format
    # Returns a string of the form "TITLE by ARTIST"
#   end
end

class Game
  def initialize(title, artist) # title and artist are both strings
  end

#   def format
    # Returns a string of the form "TITLE by ARTIST"
#   end
end

class Scorecard
  def initialize(title, artist) # title and artist are both strings
  end

#   def format
    # Returns a string of the form "TITLE by ARTIST"
#   end
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