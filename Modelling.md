Modelling bowling score card:

Methods:

Game
Round
Last Round
Score

Game calls round and then score until the last round, where it initiates a special method for final score
Score stores the latest input, and keeps a running total

Scores are stored in an array of arrays. 

This can also be done with classes but to start off I just want to use methods because that's a lot easier!

(Yay hubris on chaining methods)

***How to score multiple strikes in a row:***

----
 Round 1 -  X
 score is 10
 Round 2 - X
 score is **20 for Round 1** and **10 for Round 2**
 meaning that the overall score is now 30
----
 Round 3 - X
 score is **30 for Round1** and **20 for Round 2** and **10 for Round 3**
 Meaning that the overall score is now 60
 Round 4 - X
 score is **30 for Round 1** and **30 for Round 2** and **20 for Round 3** and **10 for Round 4**
 Meaning that the overall score is now 90
 Round 5 - X
 Score is **30 for Round 1 ** 30 for round 2** and **30 for Round 3** and **20 for Round 4** and **10 for Round 5**
 Meaning that the overall score is now 120
----
 A strike is the original + and the next two throws
 if the last three rounds are equal to 10, you add 30
 if this round and last round are both equal to 10, you add 20 to the score
   