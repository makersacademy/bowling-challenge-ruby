### To set this up: ###

git clone https://github.com/tremella/bowling-challenge-ruby
There are no gems needed to install for this, 
I really wasn't feeling rspec, I just tested manually.

### testing ###

To test the code, read and run testrun.rb on the command line.
This file contains bowling card arrays I generated from bowlinggenius.com
I hard-copied the scores and commented them out under each arr.

### Core logic ###

The key logic is in codezilla.rb and has 3 functions:

strike_or_spare?  < triggers bonus calculation logic
strike?           < triggers strike-specific bonus calc logic
final_score       < turns a scorecard array into a final score

I'll be honest, I named it codezilla because it's pretty ugly.
I wrote pseudocode in this readme which may help.

forgive me  ( •_•)

# RULES:

  if the sum of a frame from 0-9 is <10, NO BONUS, else, BONUS.
    if it's a strike [10,0], bonus is the next 2 bowls.
    if it's a spare, bonus is the next bowl.
  once we get to frame 10, the only bonus is the potential 11th frame,
  which can only exist if a spare or strike is bowled.

 the highest possible score is 300, as a series of strikes 
 has a kind of 'cascade' effect.

### pseudocode ###

start with a total of 0.
for each of the 10 frames,
  for the first 9,
    if the frame's a strike or spare,
      if it's a strike,
        if the next 2 frames are strikes
          this frame is worth 30 pts.
        elsif only the first neighbour is a strike
          this frame is worth 20 pts.
        else, neighbour is not a strike
          this frame is worth 10 plus the next frame's sum.
        end
      else it's a spare
        this frame is worth 10 pts
        plus the first bowl of the next frame.
      end
    else this frame is neither strike nor spare
      so it is simply worth its sum.
    end
  for the 10th frame
    if its sum is worth at least a spare
      the frame's worth is its sum
      plus a bonus bowl!
    else if they don't even score a spare
      this frame is simply worth its sum
      no bonus bowl
    end
  end
end

