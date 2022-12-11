require_relative 'frame'
class ScoreCard

  def initialize

    @score = [
      # {frame_one: 0},
      # {frame_two: 0},
      # {frame_three: 0},
      # {frame_four: 0},
      # {frame_five: 0},
      # {frame_six: 0},
      # {frame_seven: 0},
      # {frame_eight: 0},
      # {frame_nine: 0},
      # {frame_ten: 0},
    ]
       
  end 

  def add(frame)
    @score << frame.frame_to_hash
  end

  def total

    return @score

  end

end 