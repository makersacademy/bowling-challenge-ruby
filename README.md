# Bowling Challenge (Ruby)

[![Build Status](https://app.travis-ci.com/PKilgarriff/bowling-challenge-ruby.svg?branch=main)](https://app.travis-ci.com/PKilgarriff/bowling-challenge-ruby)

## Approach

- Setup repository with useful development gems
  - rspec
  - simplecov
  - rubocop
- Add custom GoodVibes class for motivation when running tests
- make a basic flowchart for scoring a turn in ten-pin bowling
- test-drive creation of a BowlingScore class
  - add name (instance variable)
  - add current_score (instance variable)
  - added add method to increase score
- Analysed [example score diagram](/images/example_ten_pin_scoring.png)
  - will need a way of keeping track of frames
  - need a placeholder for spares and strikes
    - could it be the same thing?
    - bonus scores reamining?
  - eventually need the special case of tenth frame
- is there going to be a need to extract a Frame class?
  - would make things easier
- Test-drive creation of Frame class
  - FRAME_LENGTH constant
  - TOTAL_PINS constant
  - #initialize(frame_number)
  - #score
  - #add(score_to_add)
  - #rolls
  - #complete?
  - #strike?
  - #spare?
- Update BowlingScore class - MAX_FRAMES constant - split current_score into: - #total_score - #frame_score(number) - #current_frame - #add_new_frame - #next_frame_number
  Classes can now score entire game without applying any special rules - example rolls given would have scored 85 without modifiers
  Implement Spare scoring - responsiblity of Frame to get its own bonus points?
  BLOCKER -> I want frame to be aware of the next frame in the BowlingScore @frames array - do I do this as a dependency injection of parent_game = BowlingScore.instance? - this feels like a potential circular dependecy - should bonus point allocation be a role of Bowling Score instead? -> starting to think yes - something like a bonus_complete? on Frame that BowlingScore then checks each time a new roll takes place - can then simultaneously add roll values to previous frame as bonus while adding score to new frame

## Next Steps

- Finish the challenge

## Technologies

- Ruby
- RSpec
- SimpleCov
- Rubocop
- Travis CI

# Code Review with Nico

- bonuses are not being applied in the next roll, they are waiting an entire frame
  - fixed by calling apply_bonus after add_new_frame in the add method
- strikes are only getting one bonus, not two
  - fixed by the above change
