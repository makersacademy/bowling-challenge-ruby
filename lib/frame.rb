class Frame
  attr_reader :roll_1, :roll_2, :frame_score, :strike, :spare

  def initialize
    @roll_1 = nil
    @roll_2 = nil
    @frame_score = nil
    @strike = false
    @spare = false
  end

  def bowl
    # break if Scorecard.current_game.frames_played >= 10
    if @roll_1.nil?

      puts "First roll of the frame"
      @roll_1 = gets.chomp.to_i

      @strike = true if @roll_1 == 10

      # if Scorecard.current_game.frames[-2].spare? (return false if doesn't exist) || Scorecard.current_game.frames[-2].strike? (return false if doesn't exist)
      #   Scorecard.current_game.frame[-2].frame_score += @roll_1
      #   if Scorecard.current_game.frames[-2].strike? && Scorecard.current_game.frames[-3].strike?
      #     Scorecard.current_game.frames[-3].frame_score += @roll_1
      #   end
      # end
    elsif @roll_1 != 10
      puts "Second roll of the frame"
      @roll_2 = gets.chomp.to_i
      @spare = true if @roll_1 + @roll_2 == 10
    end

    calculate_frame_score
    end_of_frame_message
  end

  def calculate_frame_score
    if @roll_2.nil?
      @frame_score = @roll_1
    else
      @frame_score = @roll_1 + @roll_2
    end
  end

  def end_of_frame_message
    if strike?
        "You scored a Strike!"
    elsif spare?
        "You scored a Spare!"
    else
        "You scored #{@frame_score} point#{'s' if @frame_score > 1}."
    end
  end

  def strike?
    @strike
  end

  def spare?
    @spare
  end
end