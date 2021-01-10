How the game works
------------------


In Frame.rb

methods for each frame.

.roll method will be called on a certain frame and accept arguments of (first, second)

e.g. frame_1 = Frame.new
frame_1.roll(3, 5)
scorecard << first, second

call add_scores method which checks_for_frame_1 within it
    if scorecard.length < 2
    scorecard << first + second
    else 
    scorecard << first + second + scorecard[-2]
end
scorecard = [3, 5, 8]

frame_2.roll(5,4)


scorecard = [3, 5, 8, 5, 4, 17]

frame_3.roll(5, 5)
if first + second = 10
call method SPARE which would add a '/' to the end of the array and the two rolls.

scorecard = [3, 5, 8, 5, 4, 17, 5, 5, '/']

frame_4.roll(4, 2)
if scorecard[-1] == '/'
call method ADD_SPARE which would add 10 + first roll
score = scorecard [-4] + 10 + first + first + second
scorecard << score

scorecard = [3, 5, 8, 5, 4, 17, 5, 5, /, 4, 4, 39]

frame_5.roll(10, 0)
if first = 10
call method STRIKE which would add an 'X' to the end of the array

scorecard = [3, 5, 8, 5, 4, 17, 5, 5, /, 4, 4, 39, 10, 0, 'X']

frame_6.roll(8, 1)
if scorecard[-1] == 'X'
call method ADD_STRIKE which would add 10 + first and second rolls twice

score = scorecard[-4] + 2 * (first + second)
scorecard << first, second
scorecard << score

scorecard = [3, 5, 8, 5, 4, 17, 5, 5, /, 4, 4, 39, 10, 0, 'X', 8, 1, 67]

frame_7.roll(0, 0)
CALL METHOD 'GUTTER'
string 'In the gutter! bad luck!'
scorecard << first, second
scorecard << first + second + [-2]
scorecard = [3, 5, 8, 5, 4, 17, 5, 5, /, 4, 4, 39, 10, 0, 'X', 8, 1, 67, 0, 0]





