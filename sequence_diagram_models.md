# Flow Code for Sequence Diagrams

## Single roll
```flow
alias p = "Player"
alias g = "Game"
alias f = "Frame"

p->g: "roll(7)"
g->g: "current_frame.add_roll(7)"
p->g: "roll(2)"
g->g: "current_frame.add_roll(2)"
g->g: "frames << current_frame"
g-->p: "new_frame"
```

## Spare bonus
```flow
alias p = "Player"
alias g = "Game"
alias f = "Frame"

p->g: "roll(spare)"
g->g: "self.current_frame.add_roll(spare)"
g-->p: "new_frame"
p->g: "roll(5)"
g->g: "current_frame.add_roll(5)"
g->g: "last_frame.bonus += 5"
```

## Strike bonus
```flow
alias p = "Player"
alias g = "Game"
alias f = "Frame"

p->g: "roll(strike)"
g->g: "current_frame.add_roll(10)"
g-->p: "new_frame"
p->g: "roll(5)"
g->g: "current_frame.add_roll(5)"
g->g: "frames.last.add_bonus(5)"
p->g: "roll(4)"
g->g: "current_frame.add_roll(4)"
g->g: "frames.last.add_bonus(4)"
g-->p: "new_frame"
```

## Final frame - 2 strikes
```flow
alias p = "Player"
alias g = "Game"
alias f = "Frame"

p->g: "roll(strike)"
g->g: "current_frame.add_roll(10)"
g->g: "last_frame? --> true"
p->g: "roll(strike)"
g->g: "current_frame.add_roll(10)"
g->g: "last_frame? --> true"
p->g: "roll(5)"
g->g: "current_frame.add_roll(5)"
g->g: "frames << current_frame"
g->g: "game_over? --> true"
g-->p: "scores"
```

## Final frame - spare
```flow
alias p = "Player"
alias g = "Game"
alias f = "Frame"

p->g: "roll(7)"
g->g: "current_frame.add_roll(7)"
p->g: "roll(3)"
g->g: "current_frame.add_roll(3)"
g->g: "last_frame? --> true"
p->g: "roll(5)"
g->g: "current_frame.add_roll(5)"
g->g: "frames << current_frame"
g->g: "game_over? --> true"
g-->p: "scores"
```

## 2 roll final frame
```flow
alias p = "Player"
alias g = "Game"
alias f = "Frame"

p->g: "roll(6)"
g->g: "current_frame.add_roll(6)"
p->g: "roll(2)"
g->g: "current_frame.add_roll(2)"
g->g: "frames << current_frame"
g->g: "game_over? --> true"
g-->p: "scores"
```
