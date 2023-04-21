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
    frame = 1)
  end

end

def score_card(frame)
  frame = 1
    while frame < 10 do
      puts "Please roll and I will output the scores so far"
      puts "What is roll one?"
      roll_one = gets.chomp_to_i
        total_score += roll_one
      puts "What is roll two?"
      roll_two = gets.chomp_to_i
        total_score += roll_two
      puts "Your score so far is: #{total_score}"
      frame += 1
    end
 end

if roll_one != 10 && (roll_one + roll_two = 10)
  puts "You got a spare! Your first roll on frame(frame+1) will be added to total score"
elsif roll_one == 0
  puts "You got a strike! Your next two rolls on frame(frame+1) will be added to total score"

=begin
Welcome to Scorecard! Please roll and I will output the scores so far

frame(1)
what is roll one?
8
what is roll two?
1

Your score so far is: 9

frame(2)
what is roll one?
5
what is roll two?
5

You got a spare! Your first roll on frame(3) will be added to total score

frame(3)
what is roll one?
4

frame(3)
what is roll two?
4

Your score so far is 32 (bonus of 4 points from frame(2) spare for roll one of frame(3))


=end

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
