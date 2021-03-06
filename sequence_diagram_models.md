# Flow Code for Sequence Diagrams

## Roll
```flow
alias p = "Player"
alias g = "Game"
alias f = "Frame"

p->g: "roll(score)"
g->f: "Frame.new"
f-->g: "frame1"
g->g: "frame1.score << score"
```
