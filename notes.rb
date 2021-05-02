# I should be able to derive bonuses from the bowls.

# Bowls arr
# this nested arr represents each frame, which usually has 2 bowls.
# the parent arr length is USUALLY 10, unless a strike is bowled
# in the 10th frame, in which case, it's 11.

k = [[1,4],[4,5],[6,4],[5,5],[10,0],[0,1],[7,3],[6,4],[10,0],[2,8],[6]]

# RULES:
# if the sum of each frame from 0-9 is <10, NO BONUS.
# else, BONUS.
# if it's a strike [10,0], bonus is the next 2 bowls.
# if it's a spare, bonus is the next bowl.
# one we get to frame 10, the only bonus is the potential 11th frame,
# which van only exist if a spare or strike is bowled.

# the highest possible score is 300, since a long series of strikes has
# a kind of 'cascade' effect.
