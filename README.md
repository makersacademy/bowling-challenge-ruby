Bowling Challenge in Ruby - Solution
====================================

Welcome to my solution for bowling challenge in ruby. Breakdown of the planning phase and implementation can be found [here](https://miro.com/welcomeonboard/3yvUEXqUQBuhtlDvoqi0dguPQQO1Dpe78IlQpCCAsXInKl6I5EffhstSXWM2KVpz).

Please feel free to clone this repo and test in irb. The following features have been implemented.

### Strikes

The player has a strike if he knocks down all 10 pins with the first roll in a frame. The frame ends immediately (since there are no pins left for a second roll). The bonus for that frame is the number of pins knocked down by the next two rolls. That would be the next frame, unless the player rolls another strike.

### Spares

The player has a spare if the knocks down all 10 pins with the two rolls of a frame. The bonus for that frame is the number of pins knocked down by the next roll (first roll of next frame).

### Rolls

The software calculates which roll and frame we are currently on at the moment based on scores in previous frames.