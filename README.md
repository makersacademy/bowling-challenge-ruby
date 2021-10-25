Bowling Challenge in Ruby
=================

Commands to run the bowling scorecard app:
```
# open the environment.
irb

# require the menu file.
require './lib/menu.rb'

# choose option 1 from the menu.
1

# enter number of players as 1 because the scorecard does not allow for more than one at the moment.
1

# choose option 2 from the menu.
2

# enter a player name.
Bob

# start a scorecard with option 4. This will run the game through each frame and allow the player/user to enter scores for each frame/roll.
```

Notes
-----
I started this challenge with the idea of making the scorecard accessible through an interactive menu. I have managed to implement this and also overcame some blockers. These occurred when I was trying to seperate out the classes to make all the files work together smoothly. Spending so much time on how it appeared in the REPL environment meant that I ended up primarily focussing on improving my coding rather than TDD.

At this point in time, the challenge is partially completed. The below points summarize the status of the solution.
1. There is a bug in the way the bonus points are caculated at the moment (bonuses aren't updated for some unknown reason). To be revisited.
2. The current scorecard array of hashes includes 12 frames at the moment. This is incorrect and will need to be altered to accomodate the obscure ending scenario where if the user rolls a strike or a spare in the 10th frame then there are additional bonuses that need to be added.
3. In the future, I will implement a notification to the user when they have scored a 'gutter game'.
4. The scorecard only accomodates 1 player at the moment. Adding more would increase the array size drastically and so I have chosen to leave that for now.
5. TDD - I plan on coming back to this at some stage and build this app from the beginning whilst writing the tests. This will be interesting to see how much redundant code there is.
