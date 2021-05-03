# ### pseudocode ###

# start with a total of 0.
# for each of the 10 frames,
#   for the first 9,
#     if the frame's a strike or spare,
#       if it's a strike,
#         if the next 2 frames are strikes
#           this frame is worth 30 pts.
#         elsif only the first neighbour is a strike
#           this frame is worth 20 pts.
#         else, neighbour is not a strike
#           this frame is worth 10 plus the next frame's sum.
#         end
#       else it's a spare
#         this frame is worth 10 pts
#         plus the first bowl of the next frame.
#       end
#     else this frame is neither strike nor spare
#       so it is simply worth its sum.
#     end
#   for the 10th frame
#     if its sum is worth at least a spare
#       the frame's worth is its sum
#       plus a bonus bowl!
#     else if they don't even score a spare
#       this frame is simply worth its sum
#       no bonus bowl
#     end
#   end
# end
