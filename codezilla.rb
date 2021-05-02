# tested using https://www.bowlinggenius.com/

# bowls = [[3,1],[6,4],[8,2],[2,2],[3,3],[10,0],[7,2],[4,0],[9,1],[4,6],[7]]
# 107
# bowls= [[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,10],[10]]
# 300
# bowls = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
# 0
# bowls = [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[3,3],[3,3],[3,3],[3,3]]
# 36
# bowls = [[10,0],[9,1],[10,0],[9,0],[10,0],[9,1],[10,0],[10,0],[9,0],[10,8],[2]]
# 185

#forgive me :)))

total = 0

for i in 0..9 do
  if i < 9
    if bowls[i].sum == 10
      if bowls[i] == [10,0] #strike
        if bowls[i+1] == [10,0] && bowls[i+2] == [10,0]
          total += 30
        elsif bowls[i+1] == [10,0] && bowls[i+2] != [10,0]
          total += 20 + bowls[i+2][0]
        else
          total += 10 + bowls[i+1].sum
        end
      else
        total += bowls[i].sum
        total += bowls[i+1][0]
      end
    else
      total += bowls[i].sum
    end
  elsif i == 9
    if bowls[9].sum == 10
      total += bowls[9][0]
      total += bowls[9][1]
      total += bowls[10][0]
    elsif bowls[9].sum == 20
      total += bowls[9][0]
      total += bowls[9][1]
      total += bowls[10][0]
    elsif bowls[9].sum > 10 && bowls[9].sum < 20
      total += bowls[9][0]
      total += bowls[9][1]
      total += bowls[10][0]
    else
      total += bowls[9][0]
      total += bowls[9][1]
    end
  end
end

puts total
