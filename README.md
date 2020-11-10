Bowling Challenge in Ruby
=================

## Set Up
Clone the repository:
```
$ git clone https://github.com/emilyalice2708/bowling-challenge-ruby
```

## How To Use

Run the project using irb:
```
$ irb
$ require './lib/bowling_game.rb'
```
Create a new game:
```
$ game = BowlingGame.new
```
Bowl:
```
$ game.bowl(3)
$ game.bowl(6)
```
Retrieve score:
```
$ game.score
 => 9
```

Run tests with rspec.

## Goal:
- Create a Bowling class capable of counting and summing the scores of a single player's bowling game.
- Focus on high quality code, with a focus on:
    - Diagramming & TDD
    - Testing behaviour rather than state
    - Frequent commits
    - Single Responsibility Principle and encapsulation
    - Clear and readable code

## Planning

### Tests

In order of increasing complexity:

1. Can score a single frame of 0s:

[0, 0] --> Bowling.score --> 0

2. Can score a single frame of 2s:

[2, 2] --> Bowling.score --> 4

3. Can score a gutter game:

10 x [0, 0] --> Bowling.score --> 0

4. Can score a game of all 2s:

10 x [2, 2] --> Bowling.score --> 40

5. Can score a spare, followed by a 2 and all 0s:

1 x [5, 5]
1 x [2, 0]  --> Bowling.score --> 14
8 x [0, 0]

6. Can score a strike, followed by a double 2 and all 0s:

1 x [10]
1 x [2, 2]  --> Bowling.score --> 18
8 x [0, 0]

7. Can correctly score spares in final frame:

9 x [0, 0]
1 x [5, 5]  --> 12
1 x [2]

8. Can correctly score three strikes in final frame:

9 x [0, 0]
1 x [10, 10] --> Bowling.score --> 30
1 x [10]

9. Can score a perfect game:

10 x [10]
2 x [10]     -->  Bowling.score --> 300


### Bowling rules (thank you Makers) and my initial thoughts:


#### Strikes

The player has a strike if he knocks down all 10 pins with the first roll in a frame. The frame ends immediately. The bonus for that frame is the number of pins knocked down by the next two rolls. That would be the next frame, unless the player rolls another strike.

Thoughts:
- If a player scores a strike before the 10th frame, the next roll should be counted as the beginning of the next frame, as opposed to the game expecting to recieve a score of 0 for the second roll of the same frame.
- Rolls will need to be stored in order for scores to be correctly calculated.
- Guard clauses will be required to prevent errors when trying to retrieve the score before a strike score can be calculated.

#### Spares

The player has a spare if the knocks down all 10 pins with the two rolls of a frame. The bonus for that frame is the number of pins knocked down by the next roll (first roll of next frame).

Thoughts:
- As above, rolls will need storing and guard clauses required.

#### 10th frame

If the player rolls a strike or spare in the 10th frame they can roll the additional balls for the bonus. But they can never roll more than 3 balls in the 10th frame. The additional rolls only count for the bonus not for the regular frame count.

Thoughts:
- Length check of the array to ensure player doesn't roll more than alloted rolls in a game.





