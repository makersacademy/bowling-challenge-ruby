## Jordan's Bowling Scorecard

Welcome! This is my bowling scorecard written using Ruby. 
This scorecard allows you to pass in your bowling scorecard as an array eg ```[[3, 4], [5, 3], [4, 5], [5, 3], [1, 0], [3, 6], [4, 4], [3, 5], [3, 3], [7, 2]]``` and it will calculate your final score, including strikes and spares. 

## Features

  * [X] Strikes
  * [X] Spares
  * [X] 10th Frame
  * [X] Gutter Game
  * [X] Perfect Game

## How to use

- Clone this repo to your local machine
- Run IRB in your terminal and 'require './lib/scorecard' to require the program in irb
- To insert a scorecard and have your game calculated, you can use the command 'Scorecard.new('insert your scorecard here').
- This will import your scorecard into the program, to have the program calculate your final score you can use the method '.final_score'
- Happy Bowling! 

![Screenshot](https://imgur.com/Blw0tac.png)

## Testing

I used https://www.bowlinggenius.com/ to calculate my tests and ensure the scores were correct.

![Screenshot](https://imgur.com/1XinoDn.png)

## Domain Model

![Screenshot](https://imgur.com/IupQmSd.png)
