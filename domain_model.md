User Stories
--------------
```
As a player
So that I can have fun with my friends
I want to be able to play a game of bowling

As a player
So that I can play a game of bowling
I want to be able to input my score for each roll

As a player
So that I know how I did in the frame
I want to be able to see my frame score

As a player
So that I know my position on the leaderboard
I want to be able to see my total score after each frame
```

Investigating the user stories.
Take the nouns and actions highlighted in the user stories and fill in the three tables below to help us uncover some more details about them and see how they relate to each other.

Nouns
-----
game
score
roll
frame_score
total_score

Actions
---------
play game
input score
see frame score  
see total score


|Noun|Property or owner of property?|
|---------|------------|
Game|Owner of properties
Score|Owner of properties
Roll|Property of game
Frame_score|Property of score
Total_score|Property of score


|Actions|Action owner|
|---------|------------|
Play game|Game
See frame score|Score
See total score|Score
Input score|Game


|Actions|Property it reads or changes|
|---------|------------|
Play game|Runs Game.play
See frame score|Reads Score.frame_score
See total score|Reads Score.total_score
Input score|Changes game.score


|Class|Properties(instance variables)|Actions(methods)|
|---------|------------|-----------|
|Game||play,score|
|Score|frame_score, total_score|
