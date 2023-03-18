Approach

I spent time understanding how bowling scoring works.

I then thought about what responsibilities the code would have, bearing in mind that I'm not coding the game, merely the scoring.

I decided that the first step was to record the pins knocked down, which was elementary. This is scorecard.rb.

The array in scorecard.rb will then be input into score.rb

Score.rb breaks down the scoring into several logical steps:
1- The regular score per frame (straightforward)
2- The bonus score per frame (a hot mess - there are many nested ifs and poorly named variables. I've added comments to help clarify what is going on)
3- The total score per frame (straightforward)
4- The total score across all frames (straightforward)

'Score' can be called on an incomplete scorecard, which is an important feature when playing a game of bowling.

'Score' and 'scorecard' don't check the validity of input numbers. Although record_pins in scorecard.rb does prevent numbers greater than 10 being entered, there are a number of possible exploits (eg 11 pins across 2 bowls in 1 frame). Preventing this is an edge case. It could be handled within an eventual game.rb file (see point 4 below).

'Game.rb' could:
1- Ask for the number of players and their names
2- Ask each player in turn for the number of pins knocked down
3- Prevent exploits, ie a player claiming they have knocked down more pins than the game's rules permit 
4- Inform each player what frame and ball they are on, and their current score breakdown
5- Declare the end of the game and the winner

Reflections

In hindsight, it would have been better to produce a method (or even a class) for the bonus points for each of the 10 frames. The content for the methods for frames 1-8 would be virtually identical, and I could have used a module. This would have increased readability. The methods for frames 9 and 10 would have had more different content. 




