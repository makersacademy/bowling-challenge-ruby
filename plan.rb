# frozen_string_literal: true
# bowls = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
# # bowls = [10,10,10,10,10,10,10,10,10,10,10,10]
# # bowls = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

# # 1. Convert rolls into frames
# framed_bowls = []
# i = 0
# puts bowls.length
# while i < bowls.length
#   frame = []
#   frame << bowls[i]
#   if bowls[i] < 10
#     i += 1
#     frame << bowls[i] unless bowls[i].nil?
#   end
#   framed_bowls << frame
#   i += 1
# end
# puts print framed_bowls
# # 2. Convert values 0 - 9 to their frame scores:
# #    a) If the frame values don't add to 10, convert the frame to their sum
# #    b) If the frame values do add up to 10 but don't contain a 10, convert to frame sum + first value in next frame
# #    c) If the frame values contain a 10 AND the next frame doesn't, convert to 10 + next frame sum
# #    d) If the frame values contain a 10 AND so does the next frame, convert to 10 + 10 + first value in nextx2 frame
# # 3. Convert values 10 and up to 0
# # 4. Sum all values
# # 5. Count bowls at the end of every new scored_bowl added
# scored_bowls = []
# count_bowls = []
# j = 0
# while j <= framed_bowls.length
#   if j > 9
#     scored_bowls << 0
#   else
#     scored_bowls << if framed_bowls[j].sum < 10
#                       framed_bowls[j].sum
#                     elsif framed_bowls[j].include? 10
#                       if framed_bowls[j + 1].include? 10
#                         20 + framed_bowls[j + 2].first
#                       else
#                         10 + framed_bowls[j + 1].sum
#                       end
#                     else
#                       (framed_bowls[j].sum + framed_bowls[j + 1].first)
#                     end
#     count_bowls << scored_bowls.sum
#   end
#   j += 1
# end
# puts print scored_bowls
# puts print count_bowls
# puts scored_bowls.sum
