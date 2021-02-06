# Domain Model

## The Task

- Create a bowling scorecard for a single player  
- They will enter the scores themselves
- Does not need to have a UI yet
- Bowling consists of ten frames of up to two bowls (except last frame which can have up to three, if they achieve a strike or spare in first two)

## User Stories

### MVP User Stories

>As a keen bowler  
So that I can make sure my points are recorded  
I want to enter my scores for a game of bowling
>

>As a keen bowler  
So that I can keep track of how far through a game I am  
I want to see what frame and bowl I'm entering a score for  
>

>As a keen bowler  
So that I can see how well I'm doing  
I want to see my current total score in the game
>

### Stretch User Stories

>As a keen bowler  
So I can see how well I've done over the course of a game  
I want to see my score for each frame of the game
>

>As a clumsy computer user  
So I can correct my mistakes  
I want to scores I previously entered
>

## Objects & Actions

### Nouns
- Game
- Total Score
- Frames
- Current Frame
- Current Bowl

#### Objects vs Properties
- Game: Object
- Total Score: Property of Game
- Frames: Property of Game
- Current Frame: Property of Game
- Current Bowl: Property of Game

### Actions
- Enter Score

#### Action Owners/Modifiers

Action    |    Owner     | Modifies/Reads  
----------|--------------|---------------
Enter Score | Game       | Total Score, Current Frame

### Class Diagrams

Class     |   Properties      |   Methods   
----------|-------------------|--------------
Game      | total_score, frames, current_frame, current_bowl | enter_score
