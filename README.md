Created a game model to track the scores of a bowling game with up to 4 players. Users can enter the amounts of pins hit on each turn and scores will be tracked.

3.0.0 :005 > game = Game.new("peter", "george", "luke")
 => #<Game:0x000000013fabaeb0 @players=[#<Player:0x000000013fabae10 @name="peter", @frames=[#<Frame:0x000000013fabad48 @bowls=[], @pins=10>], @current=#<Frame:0x0... 
3.0.0 :006 > game.play(3)
peter to bowl
 => nil 
3.0.0 :007 > game.play(5)
george to bowl
3.0.0 :008 > game.play(9)
george hit 9 pin(s)!
george to bowl
 => nil 
3.0.0 :009 > game.current
 => #<Player:0x000000013fabacf8 @name="george", @frames=[#<Frame:0x000000013fabaca8 @bowls=[9], @pins=1>], @current=#<Frame:0x000000013fabaca8 @bowls=[9], @pins=1>> 


Included logic to ensure that only valid numbers are entered as the number of pins hit. An error is raised below as I attempted to have two goes that together are more than the max number of pins (10).

3.0.0 :011 > game.play(9)
Traceback (most recent call last):
        7: from /Users/emmanuel/.rvm/rubies/ruby-3.0.0/bin/irb:23:in `<main>'
        5: from /Users/emmanuel/.rvm/rubies/ruby-3.0.0/lib/ruby/gems/3.0.0/gems/irb-1.3.0/exe/irb:11:in `<top (required)>'
        4: from (irb):11:in `<main>'
        3: from /Users/emmanuel/Projects/bowling/bowling-challenge-ruby/lib/game.rb:42:in `play'
        1: from /Users/emmanuel/Projects/bowling/bowling-challenge-ruby/lib/frame.rb:17:in `bowl'
RuntimeError (Error, please enter a valid number of hits)
3.0.0 :012 > game.play(1)
luke to bowl
 => nil 
3.0.0 :013 > game.play(9)
luke to bowl
 => nil 
3.0.0 :014 > game.play(1)
luke hit 1 pin(s)!
peter to bowl