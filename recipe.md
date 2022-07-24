# {{Bowling Challenge}} Planned Design Recipe

## 1. Describe the Problem

As a user,
I want to count my scores
So that I know how is my scores

## 2. Design the Class System


```
┌────────────────────────────┐
│ Score                      │
│                            │
│ - count_not_spares(down_pins)
│ - count_spares(down_pins)  │
│ - count_strikes(down_pins) │
│                            │
└───────────┬────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class CountScore
  def initialize(first_roll, second_roll)
    # ...
  end

  def count 
    # Receive the knocked down pins
    # Return the sum if it's less than 10 
  end

  def spare(first_of_next)
    # Returns the sum if it's a spare
  end
  
  def strike(first_of_next, second_of_next)
    # Returns the sum if it's a strike
  end

  def tenth_frame
    # Returns the sum if it's a tenth frame
  end
end

```

## 3. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
score = Score.new(2,3)
score.count # => 5

score = Score.new(5,5)
score.count # => 10
score.spare(3) # => 10 + 3 = 13

score = Score.new(10,0)
score.count # => 10
score.strike(2,3) # => 10 + 5 = 15

score = Score.new(3,4)
score.count # => 7
score.tenth(9,1,2,3)
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

