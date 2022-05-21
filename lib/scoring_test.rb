# user_input = [
#   [3, 5], 
#   [10, 0], 
#   [5, 5], 
#   [2, 3],
#   [5, 4],
#   [1, 6],
#   [0, 10],
#   [8, 1],
#   [9, 0],
#   [2, 1]
#   ]

# user_input = [
#   [3, 5], 
#   [10, 0], # strike - adds next [5,4]
#   [5, 4]
# ]

def calculate_score(user_input)
  user_input.map.with_index { |arr, i| 
    if arr[0] == 10 # strike
      arr[0] + user_input[i+1].reduce(:+)
    elsif arr.reduce(:+) == 10 # spare
      arr.reduce(:+) + user_input[i+1][0]
    else
      arr.reduce(:+)
    end
  }.reduce(:+)
end
