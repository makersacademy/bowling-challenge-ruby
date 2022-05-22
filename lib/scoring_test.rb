def calculate_score(user_input)
  user_input.map.with_index { |arr, i| 
    if (arr[0] == 10) && (i < 9)
      arr[0] + user_input[i+1].reduce(:+) # strike
    elsif (arr.reduce(:+) == 10)  && (i < 9)
      arr.reduce(:+) + user_input[i+1][0] # spare
    else
      arr.reduce(:+)
    end
  }.reduce(:+)
end
