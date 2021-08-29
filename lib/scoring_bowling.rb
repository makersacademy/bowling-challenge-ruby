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
      if spare?(@rounds[current_frame][:bowls])
        if current_frame == 9
          arr << @rounds[current_frame][:bowls][0..2]
        else
          arr << [@rounds[current_frame][:bowls], @rounds[current_frame +1][:bowls][0]]
        end
      else
        arr << @rounds[current_frame][:bowls]
      end
        current_frame += 1
      puts "score: #{arr.flatten.sum}"
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
    bowls.include?(nil)
  end

  def spare?(bowls)
    bowls[0..1].sum == 10
  end

  def frame_count
    @frame += 1
  end

end
