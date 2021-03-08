# Quickstart

run 
`bundle install`

open app.rb
```terminal
ruby app.rb
```

Start messing around, but be careful because there isn't any error catching.

Alternatively, enter `irb -r './lib/score.rb'` in the terminal, and follow the instructions in Usage.

# Theory of Operation

Score is the class doing all the heavy lifting. It initiates with the name of the user, and creates a hash that functions as an empty score card, using `nil` as placeholders for the numbers. As the game progresses, `nil` is either replaced with a number, or left in place (i.e. after rolling a strike, the value for that frame turns from `[nil, nil]` to `[10, nil]`).

When `score.total` is run, a method re-formats the score hash into an array, with each `nil` value removed. In case of a strike or spare, this purely-numeric score array is flattened, and the next value or two is added to the cumulative score, depending on if it's a strike or a spare.

Most of the code is error-catching, and ways to add the scores in a rugged manner without keeping an external tally of the current roll. I wrote it this way to make it more rugged as a stand-alone class, I probably wouldn't've done it this way if I was writing this for an MVC application.

# Usage

The Score class in score.rb keeps the score for one user. To create a new user:
```ruby
score = Score.new("The Dude")
```
To add scores, pass the frame and score to add_score. Keep adding a score to a frame, it will return `true` when the players turn has ended, or `false` if they still have rolls left
```ruby
score.add_score(frame, number of pins)

# get a strike on your first roll
score.add_score(1, 10) # => returns true

# roll a 4 and a 6 on your third frame
score.add_score(3, 4) # => returns false
score.add_score(3, 6) # => returns true

# a rough example of intended implementation:
(1..10).each do |frame|
  loop do
    score = gets.chomp.to_i
    break if score.add_score(frame, score)
  end
end
# for an actual implementation, look at run() in ui.rb (line 9)
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