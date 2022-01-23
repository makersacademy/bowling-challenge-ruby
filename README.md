## To run:

```ruby
bundle install
irb -r './lib/game'
```

## Demo:

For the purpose of the demo, I put some p statements. The script currently only updates the total score each frame is completed- a string ‘Frame complete’ will be printed to confirm this.

The user should input  a roll at a time. When 10 is submitted, the script deducts that it was a STRIKE.

```ruby
3.0.0 :002 > game = Game.new
3.0.0 :003 > game.add_roll(5)
3.0.0 :004 > game.add_roll(10)
[Traceback deleted]
RuntimeError (invalid roll)
"Frame 1 complete"
 => "Total score: 10" 
3.0.0 :006 > game.add_roll(10)
"Frame 2 complete"
 => "Total score: 30" 
3.0.0 :007 > game.add_roll(10)
"Frame 3 complete"
 => "Total score: 50" 
3.0.0 :008 > game.add_roll(3)
 => "Total score: 56" 
3.0.0 :009 > game.add_roll(7)
"Frame 4 complete"
 => "Total score: 73" 
3.0.0 :010 > game.add_roll(7)
 => "Total score: 80" 
3.0.0 :011 > game.add_roll(2)
"Frame 5 complete"
 => "Total score: 89" 
3.0.0 :012 > game.add_roll(10)
"Frame 6 complete"
 => "Total score: 99" 
3.0.0 :013 > game.add_roll(5)
 => "Total score: 104" 
3.0.0 :014 > game.add_roll(4)
"Frame 7 complete"
 => "Total score: 117" 
3.0.0 :015 > game.add_roll(4)
 => "Total score: 117" 
3.0.0 :016 > game.add_roll(6)
"Frame 8 complete"
 => "Total score: 127" 
3.0.0 :017 > game.add_roll(10)
"Frame 9 complete"
 => "Total score: 147" 
3.0.0 :018 > game.add_roll(10)
"Frame 10 complete"
 => "Total score: 167" 
3.0.0 :019 > game.add_roll(2)
 => "Total score: 171" 
3.0.0 :020 > game.add_roll(5)
 => "Total score: 176" 
3.0.0 :021 > game.add_roll(5)
[Traceback deleted]   
RuntimeError (round complete)
```

## Features:

- user starts a round
- user can add a roll at a time using ‘#add_roll(knocked_pins) method’
- the total score is currently calculated after each complete frame

## Features in development:

- user can print breakdown of the scores
- the total score should be updated each time a roll is added

## Reflections:

I started the project with thoroughly understanding the rules of bowling and considered edge cases such as:
- the strike getting bonus for the next 2 rolls- in case of 2 strikes in a row, the first strike will get the second strike but also from the next roll

I started the project with already established ideas of the Frame and Game classes. Having started coding, I realised I needed to get a better idea for the structure so I created a table demonstrating possible bowling round.

It seems that my Game class became dependent on the Frame class and not sure how to go about this. 

Moreover, I tried to keep most of the methods private and allowed user to have access only to necessary methods. This is in consideration for potentially applying some UI to it.

Testing- I tried to keep 'test behaviour rather than state' in mind, however, it seems to be that I ended up testing state lots of the time.

## Bowling rules model:

![alt text](https://i.imgur.com/z4arXW4.jpg)

## Domain model (TBC):

![alt text](https://i.imgur.com/54Dmq6h.jpg)