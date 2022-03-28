# Planning  

- Work out paths for scoring
- score method
  - should be able to accept up to 2 rolls or 3 (if frame = 10 & r1+r2 = spare or strike)

[][][][][][][][][][]

Frames 1 - 9 can accept 2 rolls.
Frame 10 can accept up to 3.

* - user enters roll
* - roll added to the array in scorecard equivalent to (frame number - 1) - frame 1 would access array at index 0
* - when 2 entries (or 1 strike) are in the array, the frame is complete
* - if the sum of the two entries in a frame array = 10 (strike or spare) score calculation waits until the next roll to calculate bonuses

* initialize with array of 10 arrays to represent frames
* initialize with frame_number of zero
* initialize with score of 0

* user enters first roll (r1)
*   frame number updated to 1
*   roll pushed into scorecard array with index of 0 (frame_number - 1)
*   if r1 = 10, end of turn, completed frame with strike
*   else loop for turn 2
*   - if r1 + r2 = 10, completed frame with spare


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

# Scoring

## Traditional Scoring

In traditional scoring, one point is scored for each pin that is knocked over, and when less than all ten pins are knocked down in two rolls in a frame (an open frame), the frame is scored with the total number of pins knocked down. However, when all ten pins are knocked down with either the first or second rolls of a frame (a mark), bonus pins are awarded as follows.

Strike: When all ten pins are knocked down on the first roll (marked "X" on the scorescreen), the frame receives ten pins plus a bonus of pinfall on the next two rolls (not necessarily the next two frames). A strike in the tenth (final) frame receives two extra rolls for bonus pins.
Spare: When a second roll of a frame is needed to knock down all ten pins (marked "/" on the scorescreen), the frame receives ten pins plus a bonus of pinfall in the next roll (not necessarily the next frame). A spare in the first two rolls in the tenth (final) frame receives a third roll for bonus pins.
The maximum score is 300, achieved by getting twelve strikes in a row within the same game.

 Frame | Roll | Pins Knocked Down | Score Calculation|
|-----|-----|-----|-----|
| 1 | 1 | 1 | 1 |
| 1 | 2 | 4 | 1+5 = 5 |
| 2 | 1 | 4 |  |
| 2 | 2 | 5 | 5+4+5 = 14 |
| 3 | 1 | 6 |  |
| 3 | 2 | 4 | 14+6+4+5(f4r1) = 29 |
| 4 | 1 | 5 |  |
| 4 | 2 | 5 | 29+5+5+10(f5r1) = 49 |
| 5 | 1 | 10 |  |
| 5 | 2 | x | 49+10+1(f6r1+2) = 60 |
| 6 | 1 | 0 |  |
| 6 | 2 | 1 | 61 |
| 7 | 1 | 7 |  |
| 7 | 2 | 3 | 61+7+3+6(f8r1) = 77 |
| 8 | 1 | 6 |  |
| 8 | 2 | 4 | 77+6+4+10(f9r1) = 97 |
| 9 | 1 | 10 |  |
| 9 | 2 | x | 97+10 = 117 |
| 10 | 1 | 2 |  |
| 10 | 2 | 8 |  |
| 10 | 3 | 6 | 117+2+8+6 = 133 |
