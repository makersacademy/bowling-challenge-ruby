class Frame

  def self.create
    @frame = Frame.new
  end

  def self.instance
    @frame
  end

  attr_accessor :frames, :current_frame_score, :frame_number, 
  :total_scores, :pins, :bowl

  def initialize
    @frames = {
      1 => [], 2 => [], 3 => [],   #f = Frame.new
      4 => [], 5 => [], 6 => [],   #f.frames[4] to access key 4
      7 => [], 8 => [], 9 => [],
      10 => [], 11 => []
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
    if @frame_number == 10
      p 'this is the 10th FRAME NOW >>>>>>>>>>>>>>>>>>>>>>>>>'
      if pins == 10 && @current_frame_score.length == 2
        write_points_on_scorecard(pins)


        ten_strike_checker
        ten_spare_checker
        ten_open_frame_checker


        @frame_number += 1
        reset_pins
      else
          if @current_frame_score.length == 2
            write_points_on_scorecard(pins)

            ten_strike_checker
            ten_spare_checker
            ten_open_frame_checker
         
            @frame_number += 1
            reset_pins
          else
            write_points_on_scorecard(pins)

            ten_strike_checker
            ten_spare_checker
            ten_open_frame_checker

          end
      end
     # END OF TENTH FRAME CODE, THE CODE BELOW IS FOR FRAMES 1-9
    else
      if pins == 10
        write_points_on_scorecard(pins)
        write_points_on_scorecard(0)
        calculate_frame_total

        @frame_number += 1
        reset_pins
      else
          if @current_frame_score.length == 1
            write_points_on_scorecard(pins)
            calculate_frame_total
         
            @frame_number += 1
            reset_pins
          else
            write_points_on_scorecard(pins)
          end
      end
    end

    p "Current Frame #{@frame_number}: #{@current_frame_score}"
    p "Scorecard: #{@frames}"
    p "EACH FRAME SCORES: #{@total_scores}"
  end

  def write_points_on_scorecard(pins)
    @current_frame_score << pins
    @frames[@frame_number] = @current_frame_score
  end

  def reset_pins
    @current_frame_score = []
  end

  def ten_strike_checker
    if @frames[@frame_number - 1] == [10, 0] && @frames[@frame_number - 2] == [10, 0]
      @total_scores[@frame_number-2] = 20 + @current_frame_score[0]
    end
    if @frames[@frame_number - 1] == [10, 0] && @current_frame_score.length == 2
      @total_scores[@frame_number-1] = 10 + @current_frame_score[0] + @current_frame_score[1] 
    end
  end

  def ten_spare_checker
      if @frames[9][0] != 10 && @frames[9].sum == 10
        @total_scores[9] = 10 + @current_frame_score[0]
      end

      if @frames[10][0] != 10 && @frames[10].sum == 10 && @current_frame_score[2] == true
        @total_scores[10] = 10 + @current_frame_score[2]
      end
  end

  def ten_open_frame_checker
      @total_scores[@frame_number] = @frames[@frame_number].sum
  end

  def calculate_frame_total
    strike_checker
    spare_checker
    open_frame_checker
  end

  def strike_checker
    if @frames[@frame_number - 1] == [10, 0] && @frames[@frame_number - 2] == [10, 0]
      @total_scores[@frame_number-2] = 20 + @current_frame_score[0]
    end
    if @frames[@frame_number - 1] == [10, 0] && @current_frame_score.length == 2
      @total_scores[@frame_number-1] = 10 + @current_frame_score[0] + @current_frame_score[1] 
    end
  end

  def spare_checker
    if @frame_number >= 2 # check for spares starting Frame 2

      if @frames[@frame_number - 1][0] != 10 && @frames[@frame_number - 1].sum == 10
        @total_scores[@frame_number-1] = 10 + @current_frame_score[0]
      end

    end
  end

  def open_frame_checker
      @total_scores[@frame_number] = @frames[@frame_number].sum
  end


end