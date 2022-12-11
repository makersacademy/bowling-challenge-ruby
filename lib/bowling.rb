class Application

  def initialize(io = Kernel)
    @io = io
    @frame = 1
    @scores = []
  end

  def run
    # Add loops to ensure a valid number is entered each roll?
    10.times do
      @io.puts "Frame #{@frame}"
      @io.puts "How many pins were knocked down by the first roll?"
      @first_roll_score = @io.gets.chomp.to_i
      if @first_roll_score == 10
        @scores << 10
        @scores << 0
        @second_roll_score = 0
        @io.puts "Strike!"
      else
        @io.puts "How many pins were knocked down by the second roll?"
        @second_roll_score = @io.gets.chomp.to_i
        @scores << @first_roll_score
        @scores << @second_roll_score
        @io.puts "Spare!" if @first_roll_score + @second_roll_score == 10
      end
      @frame += 1
    end

    if @scores[18] == 10
      @io.puts "You get two extra rolls as you got a strike in the 10th frame!"
      @io.puts "How many pins were knocked down by the first bonus roll?"
      @first_bonus_roll_score = @io.gets.chomp.to_i
      @io.puts "Strike!" if @first_bonus_roll_score == 10
      @scores << @first_bonus_roll_score

      @io.puts "How many pins were knocked down by the second bonus roll?"
      @second_bonus_roll_score = @io.gets.chomp.to_i
      @io.puts "Strike!" if @second_bonus_roll_score == 10
      @scores << @first_bonus_roll_score

    elsif @scores[18] + @scores[19] == 10
      @io.puts "You get an extra roll as you got a spare in the 10th frame!"
      @io.puts "How many pins were knocked down by the bonus roll?"
      @first_bonus_roll_score = @io.gets.chomp.to_i
      @io.puts "Strike!" if @first_bonus_roll_score == 10
      @scores << @first_bonus_roll_score
    end

    @scores.length > 20 ? (total_score = calculate_scores_with_bonus_rolls) : (total_score = calculate_scores_with_no_bonus_rolls)

    @io.puts "You scored #{total_score}!"
    @io.puts "That's a gutter game! Better luck next time" if total_score == 0
    @io.puts "That's a perfect game! Congratulations!!" if total_score == 300
  end

  # Calculates total score in the case that there was at least one bonus roll in the 10th frame
  def calculate_scores_with_bonus_rolls
    total_score_after_bonus_rolls = calculate_scores_with_no_bonus_rolls

    if @scores[18] == 10 && @scores[16] == 10
      total_score_after_bonus_rolls += ((@scores[20] * 2) + @scores[21])
    elsif @scores[18] == 10
      total_score_after_bonus_rolls += (@scores[20] + @scores[21])
    elsif @scores[18] + @scores[19] == 10
      total_score_after_bonus_rolls += @scores[20]
    end

    return total_score_after_bonus_rolls
  end

  # Calculates total score in the case that there were no additional rolls in the 10th frame
  def calculate_scores_with_no_bonus_rolls
    total_score = 0
    @scores.each_with_index do |element, index|
      break if index >= 19
      next if index.odd?
      round_score = element + @scores[index + 1]
      if index == 0
        total_score += round_score
      elsif @scores[index - 2] == 10 && @scores[index - 4] == 10 && index > 2
        total_score += (element * 3)
        total_score += (@scores[index + 1] * 2)
      elsif @scores[index - 2] == 10
        total_score += (round_score * 2)
      elsif @scores[index - 2] + @scores[index - 1] == 10
        total_score += ((element * 2) + @scores[index + 1])
      else
        total_score += round_score
      end
    end
    
    return total_score
  end
end

# Application.new.run