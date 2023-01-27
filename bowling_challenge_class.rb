class BowlingScorecard
  def initialize
    @score = [[0]]
    @fn = 0 
    @f= 1
  end

  def play
    10.times {
      handle_frame
    }
    handle_bonus_frame
  end

  def handle_frame
    puts "Input score Frame #{@f} Ball 1"
    input = gets.chomp.to_i
    if input == 10
      handle_strike(input) 
    elsif input < 10
      handle_regular_frame(input)
    end
  end

  def handle_strike(input) 
    prev_frame_strike_or_spare = (((@score[@fn].sum / @score[@fn].size) == 10) || ((@score[@fn].sum / @score[@fn].size) == 5))
    prev_two_frames_strikes = (((@score[@fn].sum / @score[@fn].size) == 10) && ((@score[@fn - 1].sum / @score[@fn -1].size) == 10))
    @f += 1
    framescore = []
    
    if prev_frame_strike_or_spare 
      @score[@fn] << input
      if prev_two_frames_strikes
        @score[@fn - 1] << input
      end
      framescore << input
      @score << framescore
      puts "Scorecard:#{@score[1..-1]}"
      puts "Strike! Total pending..."
    else
      framescore << input
      @score << framescore
      puts "Strike! Total pending..."
    end
    @fn += 1
  end

  def handle_regular_frame(input)
    if (@score[@fn].sum / @score[@fn].size) == 5  
      @score[@fn] << input
    end
    if (@score[@fn - 1].sum / @score[@fn - 1].size) == 10  
      @score[@fn - 1] << input
    end
    puts "Input score Frame #{@f} Ball 2"
    input2 = gets.chomp.to_i
    @f += 1
    if (@score[@fn].sum / @score[@fn].size) == 10
      @score[@fn] << input
      @score[@fn] << input2 
    end
    framescore = [input, input2]
    @score << framescore 
    if framescore.sum == 10 
      puts "Spare! Running total pending..."
    else
      puts "Scorecard:#{@score[1..-1]}" " TOTAL: #{@score.flatten.sum}"  
    end  
    @fn += 1
  end

  def handle_bonus_frame
    tenth_frame = (@score[10].sum / @score[10].size)
    interim_scorecard = puts "Scorecard:#{@score[1..-1]}" " TOTAL: #{@score.flatten.sum}"
    if tenth_frame < 10
      puts "Final score: #{@score.flatten.sum} - Game Over!"
    elsif tenth_frame == 10
      puts "Input score For Bonus Ball 1"
      input3 = gets.chomp.to_i
      if input3 == 10
        puts "Strike!"
        @score[9] << input3
        @score[10] << input3
        interim_scorecard  
        puts "Input score For Bonus Ball 2"
        input4 = gets.chomp.to_i
        if input4 == 10
          puts "Strike!"
          @score[10] << input4
          puts "Scorecard:#{@score[1..-1]}" " TOTAL: #{@score.flatten.sum} - Game Over!"
        elsif input4 < 10
          @score[10] << input4
          puts "Scorecard:#{@score[1..-1]} - Game Over!"
        end
    elsif input3 < 10
        @score[10] << input3
        interim_scorecard
        puts "Input score For Bonus Ball 2"
        input4 = gets.chomp.to_i
        @score[10] << input4
        puts "Scorecard:#{@score[1..-1]}" " TOTAL: #{@score.flatten.sum} - Game Over!"
      end
    end
  end

end

mycard = BowlingScorecard.new
mycard.play

