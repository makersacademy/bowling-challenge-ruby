For this task we had to create a bowling score keeping app. Rather than having a particular set of user stories to work to the focus of the challenge was to write high-quality code.

Score keeping in bowling can get very complicated, depending on whether a strike or a spare was scored,  the score is not updated till either the next two balls or next ball is scored. As such my approach to the the challenge was to start with a simple program that assumes that no strikes or spares are scored and once that is working to adapt the functionality to spares and then finally, strikes, and then ofcourse the final frame will require its own method. I will start by writing the tests and then develop the code from there.  

I need to make sure that even when trying to extract logic from one method into its own individual method that I consider whether the new method needs to be TTD'd, and the answer is more than likely to be yes, as even if previous tests pass new interactions need to be taken into account.

Currently my score method needs to be refactored as it is doing too much, and I need some way of recording the final frame, and scoring a perfect game. 