# Development notes for Bowling challenge - Ruby version

## How to run:



## User stories

```
As a bowler,
So that I can keep track of my successes,
I would like to input my score.
```

```
As a bowler,
So that I can see how I am doing,
I would like to see my total tracked score.
```

```
As a bowler,
So that I can see how I have done each round,
I would like each round to take two scores (totalling 10) or a single strike.
```

```
As a bowler,
So that I can accurately keep track of my score,
I would like strikes to be calculated correctly.
```

```
As a bowler,
So that I can accurately keep track of my score,
I would like spares to be calculated correctly
```

## Development thoughts

*[x] First step, I need a way for users to input a score
*[x] Next I will need ask the user for the input
*[x] Then I will need to link the two
*[ ] Now I will need a way to keep a total score tracked. Perhaps it would be best to use a csv form for this which overwrites each time the game restarts.
*[x] Currently used an array for the above ^
*[x] I actually think I will need to undo some of the work I have already done and develop a main scorecard app which will run everything when it is started in ruby. So let's undo the combined '.user_report' method
*[x] I should implement a 'quit' command so that if a user's input == 'quit' the whole program will stop.
*[x] Need to extract some methods into a new class 'score'



## Development steps

1. Established development environment:
  * Ran bundle init
  * added relevent gems to gemfile
  * ran bundle
  * reformatted rspec for personal preferences
  * added a .gitignore file
  * added Gemfile.lock to .gitignore
  * ran rspec --init
  * first commit
2. Completed first user story
  * Created rspec test for inputting a score
  * passed test
  * created a test to ask user for input
  * passed test
  * edited 'user request test' so that it included '.input'
  * passed test with 'gets' stub
3. Refactor/ replan
  * Pulled apart the '.user_request' method so that they are currently completely separate.
  * Edited test so it accommodates for this change.
  * Added a score_array which add_score adds user input to
  * Edited tests to accommodate this
  * Made tests for a total_score method
  * Built total_score method
  * All tests green.
  * Extracted methods from ScoreCard into Score Class
  * Implemented quit function so that users can quit the app
