README & user stories file

# Project Title:
Bowling-Challenge-Ruby

# Motivation: 
Attempt to complete week (5) - Solo weekend challenge with the aim to focus on the logic for bowling. For this challenege, I will be completing a Bowling Scorecard programme. Next end-of-unit challenge, I will have the chance to translate the logic to Javascript and build a user interface. - Please see the Readme instructions for further information.

The focus will be on the following criteria:
* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code

# Installation:
- git clone git@github.com:[ElliottZaki]/bowling-challenge-ruby.git
- cd bowling-challenge-ruby
- RVM: ruby-3.0.2
- bundle
- rspec 
- rubocop '1.20'
- simplecov

# Notable sources & references
https://ruby-doc.org/

# Build status:
Start
README.MD
Testing stage

# Project:
I am going to build a bowling score card programme. A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

# User story Template:
As a <Stakeholder>,
So that <Motivation>,
I'd like <Task>.

# User story 1:
As an avid bowling player
So that I can keep track of my score.
I would like to have a scorecard.
____________________
noun     |   verb
---------|----------
player   | track
scorecard|  
         |  

scorecard --->  ---> .

# Domain Model example:
<div align="center">
  <img src="public/Domain Model - Bowling_Scoreboard.jpg" width="650">
</div>





