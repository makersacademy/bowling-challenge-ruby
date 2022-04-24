Bowling Challenge in Ruby
=================

# To set up and run the Bowling Scorecard...

# 1. Clone repo https://github.com/Ramble-Tamble-70/bowling-challenge-ruby.git
# 2. Run bundle install
# 3. Open irb and enter - require './lib/bowling_scorecard.rb'
# 4. Instantiate the Scorecard class with; card = Scorecard.new (for example)
# 5. To 'bowl' and record your score do card.bowl(0) - passing your score as a parameter
# 6. Keep adding scores, a strike of 10 will also pass 0 for the next round
# 7. I added functionality to create spares, bonuses and gutter games
# 8. You have to do 'play' 10 rounds before you can return your score with; card.score
(trying before will raise an error)


To make the project I did all initial setting up.

- fork and pull challenge repo
- git init and git cloned repo
- rspec init to create spec_helper file
- required & added simplecov dependency in spec_helper
- created gemfile and added testing dependencies incl. simplecov, rspec & rubocop
and specified ruby version - updated ruby -v with rvm install-3.1.1
- did gem bundle install

# What I didn't manage yet - to improve on, I would have liked to have separated the scoring and other concerns but ran out of time and other functionalities like calculating a perfect score etc.

- Started planning the basic game score structure and look at 10th frame bonuses/perfect games later
  # 10 frames are allowed in total 
  # Each 'bowl' is the number of pins that were knocked down
  # There are 10 points for a 'strike' (all ten pins) and the frame ends immediately
    - bonuses are added after a strike, the number of pins knocked down by next 2 'rolls'
  # There is a second frame if any pins standing with 2 more rolls
  # A 'spare' is when player has knocked down 10 with the 2nd roll
   - bonuses are pins knocked down by next roll
  # Keep game score - 2 rolls = 20 / Gutter' games are when player misses all ten pins - scores 0
   - Have Score not as a definition - keep score with @score instance


# Scorecard designing process
- Focus on creating each test methodically for each step of plan
- Tried to focus on TDD and testing behaviour rather than state
- Use SRP and encapsulation
- Commit often with clear commit messages

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday week

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

As usual please start by

* Forking this repo

* Finally submit a pull request before Monday week at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday week at 9am. 

___STRONG HINT, IGNORE AT YOUR PERIL:___ Bowling is a deceptively complex game. Careful thought and thorough diagramming — both before and throughout — will save you literal hours of your life.

## Focus for this challenge
The focus for this challenge is to write high-quality code.

In order to do this, you may pay particular attention to the following:
* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code

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
