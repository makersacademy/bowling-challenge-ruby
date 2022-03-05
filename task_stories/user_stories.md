# Problem breakdown

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


### User story 1 - Start a game

```
As a Player
So that I can start a game
I want to have a new scorecard
```

#### Object Model

Object | Scorecard
--------------- | --------------------
Player (user) | 
Scorecard | .create


------

### User story 2 - Calculate frame score

```
As a Player
So that I can accumulate my game score 
I want to update the scorecard with number of pins knocked down
```


#### Object model

Object | Scorecard
--------------- | --------------------
Player (user) | 
Scorecard | .create
Scorecard | .update

------

### User story 3 - Know which frame it is

```
As a Player
So that I can calculate my score 
I want to know which frame I am on
``` 


#### Object model

Object | Frame
--------------- | --------------------
Player (user) | 
Frame | .number

#### Object model

Object | Scorecard
--------------- | --------------------
Player (user) | 
Scorecard| .frame_number

------

### User story 4 - Gutter game

```
As a Player
So that I can process not knocking down any pins
I want to post zero score if no pins knocked down
```

#### Object model

Object | Scorecard
--------------- | --------------------
Player (user) | 
Scorecard | .update

------

### User story 5 - Strike

```
As a Player
So that I can process a strike
I want to end a frame if I knock down ten pins on my first roll
```

#### Object model

Object | Scorecard
--------------- | --------------------
Player (user) | 
Frame | .finished?

------

### User story 6 - Strike Bonus

```
As a Player
So that I can process a strike bonus
I want to double up on my next frame points if I had a previous strike
```

#### Object model

Object | Scorecard
--------------- | --------------------
Player (user) | 
Frame | .calculate_bonus

------


### User story 7 - Spare

```
As a Player
So that I can process a spare bonus
I want to double up on my next roll points if I had a previous spare
```

#### Object model

Object | Scorecard
--------------- | --------------------
Player (user) | 
Frame | .calculate_bonus

------


### User story 8 - Tenth Frame

```
As a Player
So that I can process a bonus on the tenth frame
I want to roll one extra ball
```

#### Object model

Object | Scorecard
--------------- | --------------------
Player (user) | 
Frame | .additional.roll

------

#### CRCs

```
|------------------------------------------|
|                 Frame                    |
|------------------------------------------|
| Responsibilities        |  Collaborators |
|------------------------------------------|
| Knows pin score         |                |
|------------------------------------------|
| Knows number of rolls   |   Scorecard    |
|------------------------------------------|
| Knows which frame it is |                |
|------------------------------------------|
| Is finished?            |                |
|------------------------------------------|
| Calculate frame score   |   Scorecard    |
|------------------------------------------|
| Work out bonus          |                |
|------------------------------------------|


|------------------------------------------|
|                  Scorecard               |
|------------------------------------------|
| Responsibilities        | Collaborators  |
|------------------------------------------|
| Knows which frame it is |                |
|------------------------------------------|
| Knows the overall score |   Frame        |
|------------------------------------------|
| Knows frame score       |                |
|------------------------------------------|
| Add bonus points        |                |
|------------------------------------------|
| Final score             |                |
|------------------------------------------|
```


