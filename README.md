# bowling-scorecard

In this project I will be creating the logic behind a scorecard for a game of bowling for an individual player.

---

#### How to run

- Install Ruby on your computer
- Clone my repository: `git clone https://github.com/EMDevelop/bowling-scorecard.git`
- Navigate into the `bowling-scorecard` repository
- Run `bundle install` to install dependencies required for the testing framework.
- In the root folder of the directory, start the game by running: `ruby ./lib/game.rb`
- Enter your scores frame by frame:
  - 1 game has 10 frames
  - Each frame has 2 rolls each, except
    - if you get a strike you move onto the next frame
    - if it is the last game, then you have 3 rolls if roll 1 & 2 are a strike/spare

#### My Approach

I decided to map out the requirements into User Stories, breaking down the various rules and features of the game into testable and client readable step (see `User Stories`).

I have ordered the user stories in terms of complexity, each test will increase in complexity allowing while allowing my tests to be in keeping with the rules of the game.

Tests will provide an accurate assessment of the behavior of my application, I will not be testing specific implementation.

- This application is 100% tested.
- I've used encapsulation to keep responsibility contained within the relevant domain
- I used class inheritance to handle the additional functionality of the last game
- Tested various edge cases to ensure my calculator is functioning correctly.

---

#### Planning

##### User Stories

```
As a Player
So that I can finish a game of bowling
I want the game to have 10 frames

As a Player
So that I can start a game of bowling
I want to be able to knock over 10 pins in a roll

As a Player
so that I can play again
I want the pins to reset after every frame

As a Player
So that I can have a second chance to hit 10 pins
I want to be able to have a second roll

As a Player
So that I know how well I am playing
I want to be able to keep track of my scores

As a Player
So that I can move onto my next turn after a knocking all 10 pins in one go
I want my current frame to be marked complete after a strike

As a Player
So that everyone can see how I played
I want to be informed of my final score

As a Player
So that I can be rewarded for hitting all 10 pins in one go
I want to receive a bonus for a Strike, my roll score should be incremented by the number of pins knocked in the next 2 rolls

As a Player
So that I can be rewarded for hitting all 10 pins in 2 goes (in a frame)
I want to receive a bonus for my Spare, my roll score should be incremented by the number of pins knocked in the next 1 roll

As a Player
So that I can finish the game
My 10th frame should go for no longer than 3 rolls in total

As a Player
So that I know how well I am playing
I want to know my score so far after each frame

As a Player
So that I can brag to my friends for hitting 12 strikes
I want to be informed that I scored a Perfect Game

As a Player
So that I can laugh at my performance hitting 20 zeros
I want to be informed that I scored a Gutter Game

```

##### Domain / Class Model

`class: Player`
|Methods|Attributes|
|-|-|
|roll()||
|current_score(Game.calculate)||

`class: Game`
|Methods|Attributes|
|-|-|
|start_game()|NUMBER_OF_PINS Constant = 10|
|setup_frames()|
|calculate_score()|NUMBER_OF_FRAMES Constant = 10|
|end_game()|@frames Array[frame,frame]|
||@player|

`class: Frame`
|Methods|Attributes|
|-|-|
|play()|
|end_frame?()|MAX_ROLLS Constant = 3|
||@frame_number|
||@first_roll_score Integer|
||@second_roll_score Integer|
||@remaining_pins Integer|

##### Questions

- How well did I conform to Behavioral testing? I feel like at parts I had no choice but to test instance variables
