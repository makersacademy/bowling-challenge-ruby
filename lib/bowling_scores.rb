class BowlingScores

  def initialize
    @total_score = []
    @results = []
  end

  def record(result)
    @results << result
  end 

  def calculate_score(@results)
    array.each_with_index do |element, index|
      if element == [10, 0] && array[index + 1] == [10, 0] && array[index + 2] == [10, 0] && index <= 8
          @total_score << 30
      elsif element == [10 ,0] && index == 9 && array[index + 1] == [10, 0] && array[index + 2] == [10, 0]
          @total_score << 30
      elsif element == [10, 0] && array[index + 1] == [10, 0] && array[index + 2] != [10, 0] && index <= 8
          @total_score << 20 + array[index + 2][0]
      elsif element == [10, 0] && array[index + 1] != [10, 0] && array[index + 2] != [10, 0] && index <= 8
           @total_score << 10 + array[index + 1].inject(:+)
      elsif element.inject(:+) == 10 && element[1] != 0 && index <= 8
           @total_score << 10 + array[index + 1][0]
      elsif element.inject(:+) == 10 && element[1] != 0 && index == 9
          @total_score << 10 + + array[index + 1][0]
      elsif index <= 9 
           @total_score << element.inject(:+)
      end
      @total_score.inject(:+)
      end
  end

end


# array.each_with_index do |element, index|
    
#     if element == [10, 0] && array[index + 1] == [10, 0] && array[index + 2] == [10, 0] && index <= 8
#         total_score << 30
#     elsif element == [10 ,0] && index == 9 && array[index + 1] == [10, 0] && array[index + 2] == [10, 0]
#         total_score << 30
#     elsif element == [10, 0] && array[index + 1] == [10, 0] && array[index + 2] != [10, 0] && index <= 8
#         total_score << 20 + array[index + 2][0]
#     elsif element == [10, 0] && array[index + 1] != [10, 0] && array[index + 2] != [10, 0] && index <= 8
#          total_score << 10 + array[index + 1].inject(:+)
#     elsif element.inject(:+) == 10 && element[1] != 0 && index <= 8
#          total_score << 10 + array[index + 1][0]
#     elsif element.inject(:+) == 10 && element[1] != 0 && index == 9
#         total_score << 10 + + array[index + 1][0]
#     elsif index <= 9 
#          total_score << element.inject(:+)
#     end

# end

# p total_score.inject(:+)















# ======Strike logic=======

# array = [
#   [10, 0],
#   [10, 0],
#   [10, 0],
#   [10, 0],
#   [10, 0],
#   [10, 0],
#   [10, 0],
#   [10, 0],
#   [10, 0],
#   [10, 0],
#   [10, 0],
#   [10, 0],
# ]

# total_score = []

# array.each_with_index do |element, index|
#     if element == [10, 0] && index < 10
#         if array[index + 1] == [10, 0] && index < 10
#             if array[index + 2] == [10, 0] && index < 10
#                 total_score << 30
#             end
#         end
#     end
# end

# p total_score.inject(:+)

# ===============================



# array = [
#   [3,2],
#   [5,2],
#   [10, 0],
#   [10, 0],
#   [3,6],
#   [5,5],
#   [3,4],
#   [4,1],
#   [0,0],
#   [1,1],
# ]

# total_score = []
# array.each_with_index do |element, index|  

#   if element[0] == 10
#     total_score << 10 + array[index+1].inject(:+)
#     puts "Round #{index + 1}: #{10 + array[index+1].inject(:+)}"
#   elsif element.inject(:+) == 10
#      total_score << 10 + array[index+1][0]
#      puts "Round #{index + 1}: #{10 + array[index+1][0]}"
#   else 
#     total_score << element.inject(:+)
#     puts "Round #{index + 1}: #{element.inject(:+)}"
#   end
# end 

# p total_score.inject(:+)


# array = [
#   [3,2],
#   [5,2],
#   [10, 0],
#   [10, 0],
#   [3,6],
#   [5,5],
#   [3,4],
#   [4,1],
#   [0,0],
#   [1,1],
# ]

# total_score = []

# array.each_with_index do |element, index|
 
#     # 3 Strikes in a row / Perfect Game
#     if element == [10, 0] && index < 10
#         if array[index + 1] == [10, 0] && index < 10
#            total_score << 10 + 10 + array[index + 2][0]
#         elsif  array[index + 1] != [10, 0] && index < 10
#                 total_score << 10 + array[index + 1].inject(:+)
#             if array[index + 2] == [10, 0] && index < 10
#                 total_score << 30
#             end
#         end

#     #Spares
#     elsif element.inject(:+) == 10 && element[1] != 0 && index < 10
#       total_score << 10 + array[index + 1][0]

#     #Normal
#     else
#         total_score << element.inject(:+) 
#     end

# end

