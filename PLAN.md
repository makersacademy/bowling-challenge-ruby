- Work out paths for scoring
- score method
  - should be able to accept up to 2 rolls or 3 (if frame = 10 & r1+r2 = spare or strike)

[][][][][][][][][][]

Frames 1 - 9 can accept 2 rolls.
Frame 10 can accept up to 3.

# - user enters roll
# - roll added to the array in scorecard equivalent to (frame number - 1) - frame 1 would access array at index 0
# - when 2 entries (or 1 strike) are in the array, the frame is complete
# - if the sum of the two entries in a frame array = 10 (strike or spare) score calculation waits until the next roll to calculate bonuses

# initialize with array of 10 arrays to represent frames
# initialize with frame_number of zero
# initialize with score of 0

# user enters first roll (r1)
#   frame number updated to 1
#   roll pushed into scorecard array with index of 0 (frame_number - 1)
#   if r1 = 10, end of turn, completed frame with strike
#   else loop for turn 2
#     if r1 + r2 = 10, completed frame with spare


Order of play
  1) input pins
  2) increment frame number +1 (start first frame)
standard
  3) add knocked down pins to scorecardarray[0]
  4) add second roll
  5) add knocked down pins to scorecardarray[0]
  6) end turn
  7) calculate score
if strike
  3) add strike to scorecardarray[0]
  4) end turn
  5) don't calculate score until r2 of the next frame
if spare
  3) add spare to scorecardarray[0]
  4) end turn
  5) don't calculate score until r1 of the next frame