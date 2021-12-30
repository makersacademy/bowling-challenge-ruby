# Bowling Challenge in Ruby

- Feel free to use google, your notes, books, etc. but work on your own
- If you refer to the solution of another coach or student, please put a link to that in your README
- If you have a partial solution, **still check in a partial solution**
- You must submit a pull request to this repo with your code by 9am Monday week

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

As usual please start by

- Forking this repo

- Finally submit a pull request before Monday week at 9am with your solution or partial solution. However much or little amount of code you wrote please please please submit a pull request before Monday week at 9am.

**_STRONG HINT, IGNORE AT YOUR PERIL:_** Bowling is a deceptively complex game. Careful thought and thorough diagramming — both before and throughout — will save you literal hours of your life.

## Focus for this challenge

The focus for this challenge is to write high-quality code.

In order to do this, you may pay particular attention to the following:

- Using diagramming to plan your approach to the challenge
- TDD your code
- Focus on testing behaviour rather than state
- Commit often, with good commit messages
- Single Responsibility Principle and encapsulation
- Clear and readable code

## Bowling — how does it work?

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

# Notes and Thoughts

Specifications for Bowling Scorecard Program:

- can start a game (bowl 10 frames)
  (- promt for player's name)
  (- if 2 or more players, players can take turns)
- count number of pins knocked down: .roll(number_of_knockdown_pins)
- get user's input to enter the number of pins knockdown for each roll
- caculates the final score (sum)
- checks for gutter game (0pts)
- checks for spares (1 bonus from the 1st roll of next frame)
- checks for strikes (2 bonus from the two rolls of next frame)
- shows 300pts for a perfect game
- shows 150pts for a 'all' spares game

Game flow 1 (only works with a COMPLETE game of 10 frames)
We have 1 array that holds all the rolls (number of knocked down pins)
we check each item of the array using the index to see if it's a strike, a spare, or just 2 rolls (no bonus)
we add the right amount of points for each frame to total_score

```
def score
game initializes
get the player name
total_score = 0
20.times
    player's enters his/her 1st roll    #roll(num)
        if strike?
            - total_score += 10pts + pts from next 2 rolls (from next frame)
            - end_frame
        else
            player's enters his/her 2nd roll   #roll(num)
            if spare?
                - total_score += 10pts + pts from next roll (from next frame)
                - end_frame
            else
                - total_score += frame_score (no bonus)
                - end_frame
            end
        end
end
```

todo : how to `end_frame`?

Game flow 2 (only works with a COMPLETE game of 10 frames)

```
game initializes
get the player name
total_score = 0
roll_index = 0 (array @roll_list: first item = 0)
def score
    10.times (calculate frame by frame not roll by roll => before 20.times)
        if strike?
            - total_score += #strike_score
            - end frame : roll_index += 1
        else
            if spare?
                - total_score += #spare_score
                - end frame: roll_index += 2
            else
                - total_score += frame_score (no bonus)
                - end frame: roll_index += 2
            end
        end
     end
end
```

note: to move to the next frame, we can see from the diagrams bellow, that if there is a strike there won't be a second roll for the current frame so we add only 1 to the index to move to the next frame
for a perfect score, there will only be 12 elements in `@roll_list`: 10 strikes + 2 extra rolls (bonus for 10th frame)

[Diagram for the Classes ] : (images/diagram1.png)
[Diagram for the methods ] : (images/diagram2.png)

not sure we need a player from the start. I will implement all the features with just the game class and extract a player class later.

### TDD BowlingGame class

As we are only creating a scorecard for a 10 frames game I realised it would be tedious to enter each roll manually when testing though we will need `roll(num)` when we have player class to get the player's roll.

```
describe 'roll_list' do
    it 'can store several rolls in an array' do
      game.roll(6)
      game.roll(8)
      game.roll(2)

      expect(game.roll_list[0]).to eq 6
      expect(game.roll_list[1]).to eq 8
      expect(game.roll_list[2]).to eq 2
    end
  end
```

we can add a default value to `@roll_list` when we initalize `BowlingGame`to make the testing easier as we are testing a full game of 10 frames

```
describe BowlingGame do
  it 'can initialize a game' do
    game = BowlingGame.new
  end

  context 'it can be initialized with 1 default argument' do
    it 'receives no argument' do
      game = BowlingGame.new
      expect(game.roll_list).to be_empty
    end

    it 'receives 1 argument' do
      game = BowlingGame.new([1,4,7])
      expect(game.roll_list).to eq [ 1, 4, 7]
    end
  end

  describe 'roll_list' do
    it 'can store several rolls in an array' do
      game = BowlingGame.new([6, 8, 2])

      expect(game.roll_list[0]).to eq 6
      expect(game.roll_list[1]).to eq 8
      expect(game.roll_list[2]).to eq 2
    end
  end
```

While TDD, this error message came back a few times :

```
 1) BowlingGame player rolls a strike calculate the total points
     Failure/Error: roll_list[@index] + roll_list[@index+1] == 10

     TypeError:
       nil can't be coerced into Integer
```

I guess it is just because the @roll_list was missing some items (index)? we need a whole game for the #outcome method to work
