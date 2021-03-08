Bowling Scoreboard Generator in Ruby
=================



               .-.
               \ /      .-.
               |_|  .-. \ /
               |=|  \ / |_|
              /   \ |_| |=|
             / (@) \|=|/   \
        ____ |     /   \@)  \
      .'    '.    / (@) \   |
     / #      \   |     |   |
     |    o o |'='|     |  /
     \     o  /    \   /'='
 jgs  '.____.'      '='





# How to use? :bowling:

Clone repository to your computer  

``git clone https://github.com/olgachmaj/bowling-challenge-ruby.git ``  

Install dependencies

`` bundle ``  

Run irb and require files

``irb  
  require './lib/game' ``  
 
Create a new instance of class ScoreBoard

``my_scoreboard = ScoreBoard.new ``  

Input rolls that happend in your game 

example: Perfect Game

`` 12.times{my_scoreboard.roll(10)} ``  

Calculate your scoreboard

``my_scoreboard.score_all ``

You will recieve a score after each frame as well as score at the end of the game. 

![alt text](https://github.com/olgachmaj/bowling-challenge-ruby/blob/main/images/m03x2E.png)
  
