Bowling Challenge in Ruby
=================

### Instructions for use

1. **Open the terminal**

2. **Create a folder**
```
$ mkdir folder_name 
```
3. **Go to the folder**
```
$ cd folder_name 
```
4. **Clone the repository**
```
$ git clone https://github.com/lisabardelli/bowling_challenge_ruby.git
```
5. **Run the game**
```
$ ruby bowling_challenge_ruby/lib/main.rb
```

## Focus for this challenge
The focus for this challenge is to write high-quality code.

* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Single Responsibility Principle and encapsulation
* Clear and readable code

## Bowling — how does it work?

### Strikes

The player has a strike if he knocks down all 10 pins with the first roll in a frame. The frame ends immediately (since there are no pins left for a second roll). The bonus for that frame is the number of pins knocked down by the next two rolls. That would be the next frame, unless the player rolls another strike.

### Spares

The player has a spare if the knocks down all 10 pins with the two rolls of a frame. The bonus for that frame is the number of pins knocked down by the next roll (first roll of next frame).

### 10th frame

If the player rolls a strike or spare in the 10th frame they can roll the additional balls for the bonus. But they can never roll more than 3 balls in the 10th frame. The additional rolls only count for the bonus not for the regular frame count.


### Gutter Game

A Gutter Game is when the player never hits a pin (20 zero scores).

### Perfect Game

A Perfect Game is when the player rolls 12 strikes (10 regular strikes and 2 strikes for the bonus in the 10th frame). The Perfect Game scores 300 points.



See the image below for some score examples.


![Ten Pin Score Example](images/example_ten_pin_scoring.png)
