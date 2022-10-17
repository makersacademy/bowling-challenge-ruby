game
|
\_> 9 x 'standard frames'
      1 final frame
       
standard frame
2x rolls
all 10 in 1 roll = strike (2x score next 2 rolls)
all 10 in 2 rolls = spare (2x score next roll)
> 10 in 2 rolls = open (move to next

Frame n:

Roll 1 -> if score == 10 then 'Strike [x]'
      \-> if score < 10 then move to Roll 2

Roll 2 (max score 10 - Roll 1):
       -> if final score == 10 then 'Spare [/]' & fininsh frame
      \-> if score < 10 then finish frame

Frame n+1
If Frame n == 'strike' or 'spare'
Add roll 1 score to frame n
If Frame n == 'strike'
Add roll 2 score to frame n too

Frame n+2
If frame n && frame n+1 == 'strike'
Add roll 1 score to frame n

4
6 [/]
= 10 + 5

5
4
= 9 == 24

10
[x]
= 10 + 10 == 44

4
6 [/]
= 10 + 10 == 54

10
[x]
= 10 + 10 + 10 == 84

10
[x]
= 10 + 10 + 5 == 109

10
[x]
= 10 + 5 + 4 == 128

5
4
= 9 == 139


