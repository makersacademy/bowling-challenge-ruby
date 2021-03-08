# Usage

The Score class in score.rb keeps the score for one user. To create a new user:
```ruby
score = Score.new("The Dude")
```
To add scores, pass the frame and score to add_score. Keep adding a score to a frame, it will return `true` when the players turn has ended, or `false` if they still have rolls left
```ruby
# get a strike on your first roll
score.add_score(1, 10) # => returns true

# roll a 4 and a 6 on your third frame
score.add_score(3, 4) # => returns false
score.add_score(3, 6) # => returns true

# intendend implementation:
while roll == true
  roll = score.add_score(frame, score)
end
```

To get the total score, just call
```ruby
score.total()
```
You can call this at any time to find the current total score.

# Flowcharts
(copy and paste codeblocks into https://playground.diagram.codes/d/flowchart)
## For each frame except the last, ask each player to input a score.
```
"'(user input) Enter score for {player 1}, frame {1}, roll{1}:'"
IF "if score<10"
"'(user input) Enter score for {player 1}, frame {1}, roll{2}:'"
 "go to next player"

ELSE
 "go to next player"
 "'(user input) Enter score for {player 2}, frame {1}, roll{1}:'"
```

## For the last frame:
```language
"'(user input) Enter score for {player 1}, frame {10}, roll{1}:'"
"'(user input) Enter score for {player 1}, frame {10}, roll{2}:'"
IF "score[roll 1 & 2].total == 10"
 "'(user input) Enter score for {player 1}, frame {10}, roll{3}:'"
 "go to next player"
ELSE
 "go to next player"
 "'(user input) Enter score for {player 2}, frame {10}, roll{1}:'"
```