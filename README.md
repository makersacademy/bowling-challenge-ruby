Bowling Challenge in Ruby
=================
The program is designed in a single class for simplicity and does not include UI handling as per the specs.
BowlingScorer class holds the frame records, which is then iterated over when scores need to be counted.

Frames
----
First 10 frames are added to the @frames array. The amount of bonus shots player can take depend on their score on the 10th frame (effectively giving 3 different options) and its scoring is different than the regular game, so bonus shots are handled with an array of many args. The bonus array is also added to the @frames.

Counting Scores
----
This method iterates over the entire @frames array (starting from index 1 and not 0).
It relies on another method to check if the previous frame was a spare or not (that is why it starts from index 1).
It adds the bonus points to the current frame if the player has scored a spare or strike, not the previous one.
It stops the count after frame 10, and checks the length of the @frames whether  the player has produced and bonus shots.
