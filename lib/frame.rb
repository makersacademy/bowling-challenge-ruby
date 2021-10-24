class Frame

  attr_accessor :frames, :current_frame_score, :frame_number, :total_scores, :pins 

  def initialize
    @frames = {
      1 => [], 2 => [], 3 => [],   #f = Frame.new
      4 => [], 5 => [], 6 => [],   #f.frames[4] to access key 4
      7 => [], 8 => [], 9 => [],
      10 => []
    }

    @total_scores = {
      1 => [], 2 => [], 3 => [],
      4 => [], 5 => [], 6 => [],
      7 => [], 8 => [], 9 => [],
      10 => []
    }


    @current_frame_score = []
    @frame_number = 1
  end

  def bowl(pins)
    fail 'frame is over' unless @current_frame_score.length < 2 
    if pins == 10
      @current_frame_score << pins
      @current_frame_score << 0 
      p "Frame #{@frame_number}: #{@current_frame_score}"
      @frames[@frame_number] = @current_frame_score
      p @frames

      strike_checker

      @frame_number += 1
      reset_pins
    else
        if @current_frame_score.length == 1
          @current_frame_score << pins
          p "Frame #{@frame_number}: #{@current_frame_score}"
          @frames[@frame_number] = @current_frame_score
          p @frames

          strike_checker
          spare_checker
          open_frame_checker

          @frame_number += 1
          reset_pins
        else
          @current_frame_score << pins
          p "Frame #{@frame_number}: #{@current_frame_score}"
          @frames[@frame_number] = @current_frame_score
          p @frames

          strike_checker
          spare_checker
          open_frame_checker

        end

      # check_valid_frame
    end
  end

  def reset_pins
    @current_frame_score = []
  end

  def strike_checker
    if @frames[@frame_number - 1] == [10, 0] && @frames[@frame_number - 2] == [10, 0]
      p '2 prev strike'
      @total_scores[@frame_number-2] = 20 + @current_frame_score[0]
      p @total_scores
    end
    if @frames[@frame_number - 1] == [10, 0] && @current_frame_score.length == 2
      p '1 prev strike'
      @total_scores[@frame_number-1] = 10 + @current_frame_score[0] + @current_frame_score[1] 
      p @total_scores  
    end
  end

  def spare_checker
    if @frame_number >= 2

      if @frames[@frame_number - 1][0] != 10 && @frames[@frame_number - 1].sum == 10
        p '1 prev spare'
        @total_scores[@frame_number-1] = 10 + @current_frame_score[0]
        p @total_scores
      end

    end
  end

  def open_frame_checker
    if @frames[@frame_number].sum < 10 && @current_frame_score.length == 2
      p 'open frame'
      @total_scores[@frame_number] = @frames[@frame_number].sum   
      p @total_scores
    else
      @total_scores[@frame_number] = @frames[@frame_number].sum
      p @total_scores
    end
  end



  def extendable?
    rolls.length < 2 || 
    (rolls[0] == 10 && rolls.length < 3) || 
    (rolls[0] + rolls[1] == 10 && rolls.length < 3)
  end

  def start_next_frame?
    rolls[0] == 10 || rolls.length > 1
  end

  # def score
  #   @rolls.inject(0, :+)
  # end

  private

  def rolls
    @rolls ||= []
  end

  # def check_valid_frame
  #   raise BowlingError if rolls.length == 2 && rolls[0] < 10 && rolls[0] + rolls[1] > 10
  # end

end