Bowling Challenge in Ruby
=================

## The Task

The task for the week 5 Makers Weekend Challenge was to create a Bowling Score Card for a single player to keep track of their game as to the rules below:

## Bowling — how does it work?

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

### Strikes

The player has a strike if he knocks down all 10 pins with the first roll in a frame. The frame ends immediately (since there are no pins left for a second roll). The bonus for that frame is the number of pins knocked down by the next two rolls. That would be the next frame, unless the player rolls another strike.

### Spares

The player has a spare if the knocks down all 10 pins with the two rolls of a frame. The bonus for that frame is the number of pins knocked down by the next roll (first roll of next frame).

### 10th frame

If the player rolls a strike or spare in the 10th frame they can roll the additional balls for the bonus. But they can never roll more than 3 balls in the 10th frame. The additional rolls only count for the bonus not for the regular frame count.

    10, 10, 10 in the 10th frame gives 30 points (10 points for the regular first strike and 20 points for the bonus).
    1, 9, 10 in the 10th frame gives 20 points (10 points for the regular spare and 10 points for the bonus).

### Gutter Game

A Gutter Game is when the player never hits a pin (20 zero scores).

### Perfect Game

A Perfect Game is when the player rolls 12 strikes (10 regular strikes and 2 strikes for the bonus in the 10th frame). The Perfect Game scores 300 points.

In the image below you can find some score examples.

More about ten pin bowling here: http://en.wikipedia.org/wiki/Ten-pin_bowling

![Ten Pin Score Example](images/example_ten_pin_scoring.png)

Planning Diagramming
===
![Planning UML Diagram](images/bowling_score_card.png)

## Installation

1. Clone this repo
2. Run the command ```gem install bundler``` (if you don't have bundler already)
3. When the installation completes, run ```bundle```


## Running Tests

Run ```rspec```


## Usage
Launch ```irb``` and use as below:
```ruby
:001 > require './lib/score_card'
 => true 
 :002 > sc = ScoreCard.new
 => #<ScoreCard:0x00007fc2671daa48 @bonus_log=BonusLog, @frame=Frame, @roll_no=0> 
 :003 > sc.enter_pins(10)
 => 10 
 :004 > sc.enter_pins(10)
 => 30 
 :005 > sc.enter_pins(10)
 => 60 
 :006 > sc.enter_pins(10)
 => 90 
 :007 > sc.enter_pins(10)
 => 120 
 :008 > sc.enter_pins(10)
 => 150 
 :009 > sc.enter_pins(10)
 => 180 
 :010 > sc.enter_pins(10)
 => 210 
 :011 > sc.enter_pins(10)
 => 240 
 :012 > sc.enter_pins(10)
 => 250 
 :013 > sc.enter_pins(10)
 => 270 
 :014 > sc.enter_pins(10)
 => 300 
 :015 > sc.enter_pins(10)
 => "You scored 300. Conratulations!" 
 ```