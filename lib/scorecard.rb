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


  def calculate_bonuses
    @score.each_with_index do |frame, index|
      if frame[:is_spare?] == true && frame[:bonus_status] == true
        next_frame = @score[index + 1]
        frame[:frame_total] += next_frame[:roll_one] 
        frame[:bonus_status] = false
       
      end
    end 
  end   

  def total
    calculate_bonuses
    return @score

  end

end 

scorecard = ScoreCard.new
      frame1 = Frame.new(6,4) 
      frame2 = Frame.new(5,2) 
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.calculate_bonuses
      scorecard.total