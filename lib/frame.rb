class Frame
  attr_reader :roll_1, :roll_2, :strike, :spare, :frame_finished
  attr_accessor :frame_score

  def initialize
    @roll_1 = nil
    @roll_2 = nil
    @frame_score = nil
    @strike = false
    @spare = false
    @frame_finished = false
  end

  def bowl
    if @frame_finished
      return "This frame has finished"
    else
      if @roll_1.nil?
        puts "This is frame number #{frame_number}"
        puts "First roll of the frame"
        @roll_1 = gets.chomp.to_i
        puts "Your first roll: #{@roll_1}"

        if @roll_1 == 10 && frame_number == 10
          @strike = true
        elsif @roll_1 == 10
          @strike = true 
          @frame_finished = true
        end

        if check_previous_frame_for_spare || check_previous_frame_for_strike
          add_roll_1_to_previous_frame_score
          if check_previous_frame_for_strike && check_2nd_previous_frame_for_strike
            Scorecard.current_game.frames[-3].frame_score += @roll_1
          end
        end

      elsif !@roll_1.nil?

        puts "Second roll of the frame"
        @roll_2 = gets.chomp.to_i
        puts "Your second roll: #{@roll_2}"

        if (@roll_1 == 10 || @roll_1 + @roll_2 == 10) && frame_number == 10
          puts "Your bonus 10th frame roll"
          @roll_3 = gets.chomp.to_i
        end

        if check_previous_frame_for_strike
          add_roll_2_to_previous_frame_score
        end

        @spare = true if @roll_1 + @roll_2 == 10
        @frame_finished = true
      end

      if @frame_finished
        calculate_frame_score
        end_of_frame_message
      else
        "Bowl again to finish the frame"
      end
    end
  end

  def strike?
    @strike
  end

  def spare?
    @spare
  end

  private

  def check_previous_frame_for_spare
    if Scorecard.current_game.frames[-2].nil?
      false
    else
      Scorecard.current_game.frames[-2].spare?
    end
  end

  def check_previous_frame_for_strike
    if Scorecard.current_game.frames[-2].nil?
      false
    else
      Scorecard.current_game.frames[-2].strike?
    end
  end

  def check_2nd_previous_frame_for_strike
    if Scorecard.current_game.frames[-3].nil?
      false
    else
      Scorecard.current_game.frames[-3].strike?
    end
  end

  def add_roll_1_to_previous_frame_score
    Scorecard.current_game.frames[-2].frame_score += @roll_1
  end

  def add_roll_2_to_previous_frame_score
    Scorecard.current_game.frames[-2].frame_score += @roll_2
  end

  def frame_number
    Scorecard.current_game.frames.count
  end


  def calculate_frame_score
    if @roll_2.nil?
      @frame_score = @roll_1
    elsif !!@roll_3
      @frame_score = @roll_1 + @roll_2 + @roll_3
    else
      @frame_score = @roll_1 + @roll_2
    end
  end

  def end_of_frame_message
    if frame_number == 10
      "You scored #{@frame_score} points in your final frame. Your final score was #{Scorecard.current_game.score}"
    elsif strike?
      "You scored a Strike!"
    elsif spare?
      "You scored a Spare!"
    else
      "You scored #{@frame_score} point#{'s' if @frame_score > 1} this frame."
    end
  end
end
