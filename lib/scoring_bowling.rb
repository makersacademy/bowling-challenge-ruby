class Scoring_Bowling

  MAX_FRAMES = 10
  MAX_PINS = 10
  attr_reader :rounds, :frame, :score

  def initialize
    @rounds = []
    @frame = 0
    @score = 0
  end

  def add_bowl(*bowls)
    raise input_error_messages[0] if @rounds.length == 10
    # raise input_error_messages[1] if !strike?(round(9)) || !spare?(round(9))
    
    @rounds << {frame: frame_count, bowls: [*bowls]}
  end
  
  def calculate_score
    current_frame = 0
    arr = []
    until current_frame == rounds.length
      if strike?(round(current_frame))

        if current_frame == 9
          arr << round(current_frame)
        elsif current_frame == 8
          arr << [round(current_frame), round(current_frame + 1)[0..1]]
        else
          arr << [round(current_frame), round(current_frame + 1)[0], round(current_frame + 2)[0]]
        end

      elsif spare?(round(current_frame))

        if current_frame == 9
          arr << round(current_frame)
        else
          arr << [round(current_frame), round(current_frame + 1)[0]]
        end

      else
        arr << round(current_frame)
      end
        current_frame += 1

    end
    @score += arr.flatten.sum
    puts "Score: #{@score}"
  end

  private

    def input_error_messages
    [
      'Game Over, no more scores can be added' ,
      'Total sum of inputs cannot exceed 10, please enter the correct values' 
    ]
  end

  def round(which_frame)
    @rounds[which_frame][:bowls]
  end

  def strike?(bowls)
    bowls.first == 10
  end

  def spare?(bowls)
    bowls[0..1].sum == 10
  end

  def frame_count
    @frame += 1
  end

end
