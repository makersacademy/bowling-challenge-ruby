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
*[ ] Now I will need a way to keep a total score tracked.

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
