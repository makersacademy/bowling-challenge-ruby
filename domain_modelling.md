
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
 27  feature_test.rb
@@ -0,0 +1,27 @@
2.2.3 :001 > g = Game.new
=> Game X0939505924;
2.2.3 :002 > g.play
=> frame 1 - roll 1 - please enter your score
=> frame 1 - roll 2 - please enter your score
Your frame score is 5
Your total score is 5
=> frame 2 - roll 1 - please enter your score
=> frame 2 - roll 2 - please enter your score
Your frame score is pending
Your total score is 5




count = 0
while count <= 10 do
  if score == 10
    total_score << 10
    puts "Frame score = pending"
    puts "Total score = #{total_score}"
    count += 1
  elsif score < 10
    total_score << score
    frame_score = score
    count += 1
  end
 100  spec/spec_helper.rb
@@ -0,0 +1,100 @@
