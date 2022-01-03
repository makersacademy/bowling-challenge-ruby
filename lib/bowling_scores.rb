class BowlingScores

  def initialize
    @total_score = []
    @results = []
  end

  def record(*scores)
    raise ArgumentError, "Too many arguments" if scores.length > 12
    @results = scores
  end 

  def calculate_score()
    @results.each_with_index do |element, index|
      if element == [10, 0] && @results[index + 1] == [10, 0] && @results[index + 2] == [10, 0] && index <= 8
          @total_score << 30
      elsif element == [10 ,0] && index == 9 && @results[index + 1] == [10, 0] && @results[index + 2] == [10, 0]
          @total_score << 30
      elsif element == [10, 0] && @results[index + 1] == [10, 0] && @results[index + 2] != [10, 0] && index <= 8
          @total_score << 20 + @results[index + 2][0]
      elsif element == [10, 0] && @results[index + 1] != [10, 0] && @results[index + 2] != [10, 0] && index <= 8
          @total_score << 10 + @results[index + 1].inject(:+)
      elsif element.inject(:+) == 10 && element[1] != 0 && index <= 8
          @total_score << 10 + @results[index + 1][0]
      elsif element.inject(:+) == 10 && element[1] != 0 && index == 9
          @total_score << 10 + @results[index + 1][0]
      elsif index <= 9 
          @total_score << element.inject(:+)
      end
    end
  @total_score.inject(:+)
  end

end