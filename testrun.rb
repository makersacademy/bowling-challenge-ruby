require './lib/codezilla.rb'

# these are scorecards I generated on bowlinggenius.com, to test-drive codezilla.rb
# commented out are the expected scores.

# A key feature is that I treated the bonus bowl in the 10th frame as an 11th frame with a length of 1 (instead of giving the 10th frame a length of 3)

a = [[3,1],[6,4],[8,2],[2,2],[3,3],[10,0],[7,2],[4,0],[9,1],[4,6],[7]]
# 107
b = [[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,10],[10]]
# 300
c = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
# 0
d = [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[3,3],[3,3],[3,3],[3,3]]
# 36
e = [[10,0],[9,1],[10,0],[9,0],[10,0],[9,1],[10,0],[10,0],[9,0],[10,8],[2]]
# 185
f = [[10,0],[6,4],[10,0],[10,0],[10,0],[6,4],[10,0],[10,0],[1,9],[10,8],[0]]
# 215
g = [[4,1],[9,1],[8,2],[7,3],[6,3],[5,4],[4,3],[3,2],[2,1],[0,7]]
# 96

puts final_score(a) # 107
puts final_score(b) # 300
puts final_score(c) # 0
puts final_score(d) # 36
puts final_score(e) # 185
puts final_score(f) # 215
puts final_score(g) # 96
