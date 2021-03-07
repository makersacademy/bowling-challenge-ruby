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