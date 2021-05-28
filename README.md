Beca Parker's solution to Bowling Scorecard Challenge (Ruby)  
============================================================

## What the code does

This ruby code provides the logic for counting and summing the scores of a 10-pin bowling game for one player, according to the [traditional scoring rules](https://en.wikipedia.org/wiki/Ten-pin_bowling#Traditional_scoring).

*Input:* User inputs the number of pins knocked down at each roll.  
*Output:* After each frame, [WHAT WILL THE OUTPUT BE?]. At the end of the game, the terminal will display the final score (max. 300)  


## Setup

Use these commands in your terminal:  
* `git clone https://github.com/BecaLParker/chitter-challenge`  
* `cd chitter-challenge`  
* `bundle`  
* now you can run the tests I built: `rspec`
* and/or interact as a user: [INSERT COMMAND TO RUN CODE]


## My goals during this challenge

The user interface in this solution is intentionally minimal.
Instead, the focus for this challenge was to write high-quality code.

In order to do this, I aimed to give particular attention to :
* Using diagramming to plan my approach to the challenge
* TDD the code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code

## Planning and approach

I created [user stories](./planning/user_stories.md), which in turn helped me establish a domain model: 
![domain model](./planning/)

Here are some score examples I used as a TDD basis for this code:

![Ten Pin Score Example](images/example_ten_pin_scoring.png)




