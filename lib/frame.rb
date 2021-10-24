class Frame

  def self.create
    @frame = Frame.new
  end

  def self.instance
    @frame
  end

  attr_accessor :frames, :current_frame_score, :frame_number, 
  :total_scores, :pins, :bowl, :player_score

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
    if @frame_number == 10
      p 'this is the 10th frame'
     
    else
      
      if pins == 10
        write_points_on_scorecard(pins)
        write_points_on_scorecard(0)
        @frames[@frame_number] = @current_frame_score

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

            calculate_frame_total
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
    if @frame_number >= 2

      if @frames[@frame_number - 1][0] != 10 && @frames[@frame_number - 1].sum == 10
        @total_scores[@frame_number-1] = 10 + @current_frame_score[0]
      end

    end
  end

  def open_frame_checker
    if @frames[@frame_number].sum < 10 && @current_frame_score.length == 2
      @total_scores[@frame_number] = @frames[@frame_number].sum   
    else
      @total_scores[@frame_number] = @frames[@frame_number].sum
    end
  end


end