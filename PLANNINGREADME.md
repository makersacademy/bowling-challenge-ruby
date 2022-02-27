Plan to build this game, bit by bit, using TDD:

1. A  game that accepts values, keeps a simple running total and finishes after 3 inputs
2. As above but accepts paired values (frames)
3. As above but if the first value of a pair is '10', the game moves onto a new pair (strike no  bonus)
4. As above but if the total of a pair is '10', a bonus is given depending on the next input (spare)
5. As above but if the first value of a pair is '10', the game creaytes a 'strike bonus' (strike)
6. As above but extending the 'frames' to 4, with a conditional bonus input (final frame)
7. As above but extending the total frame limit to 10 frames

The game should be able to:
- return a running score after each 'frames' (unless strike or spare bonus)
- tell the player when the game is over with  the final score
