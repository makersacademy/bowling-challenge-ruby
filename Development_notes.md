## Development notes for Makers Week 5, weekend challenge. Bowling Challenge in Ruby.

Initial perusal of the challenge requirements is to make a Bowling Scorecard program (not a bowling game)!

It also says you do not need to build a web app with a UI, instead just to focus on the logic - sooooo I am going to focus on the ruby model first and then if I have time I am going to build a database layer, and then potentially a view & controller layer.

Model:
- This is all about the logic of scoring, outlined it below.
- I am assuming that the user will input one score at a time and will not input the round number or any other details, this will be auto calculated by the game.
- the model will also have a display function which will display the current score and the score of each roll so far.

- Game Logic
  - 10 frames per game
  - each frame consists of 10 pins
  - each frame 1 to 9 has two rolls, unless a strike (10 pins) is scored in the first round.
  - frame 10 has two rolls, unless a strike is scored in which 2 extra rolls are awarded (total 3 rolls), or a spare is scored in which case 1 extra roll is awarded.
    - strikes in the last two rolls of the 10th frame do not receive bonus points

  - each frame score is the sum of the two rolls.
  - if a spare is scores (two rolls = 10 points) then a bonus score of whatever the next roll is is awarded
  - if a strike is scored (first roll of frame is 10 points) then a bonus score of whatever the next two rolls are, is added to that frames score.


  - A gutter game is 0 scores
  - A perfect game is 12 strikes in a row - total 300 points

- Miro Board with logic
    - https://miro.com/app/board/o9J_lLjv0EE=/

#### User Stories

As a user
I want to add my score into the scorecard
- accepts a score between 0 to 10 on the first roll - DONE
- on second roll - can only accept a score which brings total up to 10 max  

As a user
I want to see my current score
- you get all the scoredcard information generated - DONE
- need to implement strike and spare information
- 


As a user
I want to play 10 frames
- need to implement 10th frame mechanics
- need to implement win output - gutter game, perfect game, etc..


#### Domain Model

BowlingScorecard
- recieves a score
- keeps record of scores
- list current score
- lists all rolls to date

#### Input/Output Table

Input           |  Ouput
inputs are all scores added sequentially
10              | {round: 1, first roll: 10, second roll: n/a , score: 10, strike: yes, spare: no, bonus points: 2 bonus rolls - tbd }
5, 4, 10, 8, 1  |
{round: 1, first roll: 5, second roll: 4 , score: 9, strike: no, spare: no, bonus points: none }
{round: 2, first roll: 10, second roll: n/a , score: 10, strike: yes, spare: no, bonus points: 9 }
{round: 3, first roll: 8, second roll: 1 , score: 9, strike: no, spare: no, bonus points: 0 }
