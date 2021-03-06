# Flow Code for Sequence Diagrams

## Single roll
```flow
alias p = "Player"
alias g = "Game"
alias f = "Frame"

p->g: "roll(pins)"
g->g: "current_frame.roll1 = pins"
```

## Spare bonus
```flow
alias p = "Player"
alias g = "Game"
alias f = "Frame"

p->g: "roll(spare)"
g->g: "self.current_frame.add_roll(spare)"
g->g: "new_frame"
p->g: "roll(5)"
g->g: "current_frame.add_roll(5)"
g->g: "last_frame.bonus += 5"
```
