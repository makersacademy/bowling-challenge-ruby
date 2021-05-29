Bowling user stories
====================

#As a player,#

#### Normal frames (where player scores less than 10 in a frame)

So that I can play a 10-frame game,  
I want to know my final total score after 10 frames.  

So that I can have more than one go at knocking down the pins in a frame,  
I want the scoreboard to accumulate my score from two rolls per frame (and potentially 3 rolls in frame 10 - see special frames).  

So that I don’t get access to more than 10 pins per frame,  
I want to know if I’ve tried to enter more than  10 in total across the rolls of a frame (in frames 1-9).  


#### Special frames (where player scores 10 in a frame)  

##### Strikes  
When I knock down 10 pins in the first roll of a frame,  
I want the frame to end.  

When I knock down 10 pons in the first roll of a frame,  
I want the ‘strike bonus’ rules to apply to the next two rolls (which could be one frame, or if I get another strike - could be more than one frame)  

##### Spare  
When I knock down 10 pins with the two rolls of a frame,   
I want the the ‘spare bonus’ rules to apply to the next roll (first roll of the next frame).  

##### Strike/Spare in 10th frame  
When I roll a strike or spare in the 10th frame,  
So that the corresponding bonus rules (strike or spare) can apply,  
I want to be able to enter my score for up to 3 rolls.  

So that I can score the perfect 10th frame,  
I want to be able to enter a max of 10 per roll in the 10th frame.   

So that any additional rolls in frame 10 only count for the bonus (not for the regular frame count),  
I want the scoreboard to know if the roll I’m entering a score for is ‘regular’ vs ‘additional’.   