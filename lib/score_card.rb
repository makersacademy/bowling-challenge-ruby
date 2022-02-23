class ScoreCard
  attr_reader :total_score, :scores

  def initialize
    @scores = []
    @total_score = 0
  end

  def frame_result(array)
    @scores << array
  end

  def print_scores
    # with bonus calcs, not yet accounting frame 10
    if (@scores[-1][2] != 'none') && (@scores.length < 12)
      puts "Scores: pending bonus calculations"
    else
      @total_score = 0
      @scores.each_with_index do |score, index|
        if index >= 10
          return
        else
          puts "Frame #{index + 1}: first roll: #{score[0]}, second roll: #{score[1]}, bonus: #{score[2]}"
          @total_score += (score[0] + score[1])
          if score[2] != 'none'
            bonus_calc(index) 
          end
        end
      end
      puts "Total: #{@total_score}"
    end
  end

  def bonus_calc(index)
    if @scores[index][2] == 'strike'
      @total_score += (@scores[index + 1][0] + @scores[index + 1][1])
      if @scores[index + 1][0] == 10
        @total_score += @scores[index + 2][0]
      end
    elsif @scores[index][2] == 'spare'
      @total_score += @scores[index + 1][0]
    end
  end

end