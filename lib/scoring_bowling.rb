class Scoring_Bowling

  MAX_FRAMES = 10
  MAX_PINS = 10
  attr_reader :rounds, :frame, :score

  def initialize
    @rounds = []
    @frame = 0
    @score = 0
  end

  def add_bowl(first_bowl = nil, second_bowl = nil)
    raise input_error_messages[0] if frame == MAX_FRAMES
    raise input_error_messages[1] if [first_bowl, second_bowl].sum > MAX_PINS

    @rounds << {frame: frame_count, bowls: [first_bowl, second_bowl]}
  end
  
  def calculate_score
    current_frame = 0
    arr = []
    until current_frame >= MAX_FRAMES
      if spare?(round(current_frame))
        arr << [round(current_frame), round(current_frame)[0]]
      else
        arr << round(current_frame)
      end
      current_frame += 1
    end
    @score += arr.flatten.sum
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

  def spare?(bowls)
    bowls.sum == 10
  end

  def frame_count
    @frame += 1
  end

end
