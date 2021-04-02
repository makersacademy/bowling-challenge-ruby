## Focus for this challenge
The focus for this challenge is to write high-quality code.

In order to do this, you may pay particular attention to the following:
* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code

## Bowling Challenge

#### User stories

As a player
To see my score after a roll
I want to see the amount of pins knocked down per roll

As a player
To see my score after a frame
I want to see the points per frame added up together

As a player
To see my score throughout the game
I want to see my total points 

As a player
To understand my bonusses
I want to see the bonus points explaned to me

As a player
To finish the game
I want to get an extra roll if I hit 10 pins in the last frame

### What do I need 

- Keep track of which frame the player is at        |   @frame_count
- Keep track of which roll the player is at         |   @roll_count
- Keep trach of the amount of pins hit per roll     |   @hit_pins
- Keep track of the amount of pins hit per frame    |   @hit_pint_per_frame
- Keep track of the total score                     |   @total 
- Implement the rules                               |   module (?)
- Leave notes when any of the special rules apply   |   a hash

#### regular points:

- One point per pin hit
- Every frame has 10 pins
- Every frame is 2 rolls

#### special rules:

- Strike: All 10 pins in 1 roll.
    Ends frame
    bonus = number of pins down in the next two rolls. - That is either a frame or an other strike.

- Spare: All 10 pins in 2 rolls (1 frame).
    bonus = number of pins in the next roll

- 10th Frame: Player gets spare or strike in the last frame
    bonus = the last roll
    never more than 3 rolls

- Gutter game: No pins hit at all

- Perfect game: 12 strikes
    300 pointsx




