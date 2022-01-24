Makers Week 5 Weekend Challenge
=================
```
                                        (O)           (O)
                                        ||     (O)    ||
   .----.                               ||     ||     ||
  /   O O\                             /  \    ||    /  \
  '    O  '                           :    :  /  \  :    :
  \      /                            |    | :    : |    |
 __`----'______________________________\__/__|    |__\__/____
                                              \__/
```
# Bowling!

(You can find the details of the challenge in the CHALLENGE.md file.)

I wanted to make something that would return a scorecard after each roll was input,
but I struggled and haven't got there in time. It's not finished yet, and at the moment,
all the tests are broken, plus I've un-refactored and put everything back into one
class like a maniac since I ran out of time and wanted to have something that was
at least kind of useable.

## Example Usage
```
3.0.2 :001 > require './lib/game'
 => true 
3.0.2 :002 > game = Game.new
 => #<Game:0x000000016100e0a8 @frame_number=1, @frames=[], @scorecard=[]> 
3.0.2 :003 > game.play
9
1
5
3
10
8
1
5
2
6
4
7
2
8
1
9
0
10
10
10
 => [15, 8, 19, 9, 7, 17, 9, 9, 9, 30]
 ```
## Functionality
The user inputs their scores for a game, and it spits out an array of their scores for each frame.

## To Do 
- Add a final score to the end of the scorecard
- Format all the info properly into a nice, helpful scorecard
- Refactoring!!
- Redo all the tests!!
- Get it returning live scores as the user inputs their rolls