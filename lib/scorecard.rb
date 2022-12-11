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
    check_spare_bonus
    check_strike_bonus
  end   

  def total
    calculate_bonuses
    return @score

  end

end 

private 

def check_spare_bonus

  @score.each_with_index do |frame, index|
    if frame[:is_spare?] == true && frame[:bonus_status] == true
      next_frame = @score[index + 1]
      frame[:frame_total] += next_frame[:roll_one] 
      frame[:bonus_status] = false
    end
  end 
end 

def check_strike_bonus

  @score.each_with_index do |frame, index|
    if frame[:is_strike?] == true && frame[:bonus_status] == true
      next_frame = @score[index + 1]
      frame_after_next = [index + 2]
      if next_frame[:is_strike?] then 
        frame[:frame_total] += next_frame[:roll_one] + frame_after_next[:roll_one]
        frame[:bonus_status] = false
      else 
        frame[:frame_total] += next_frame[:roll_one] + next_frame[:roll_two]
        frame[:bonus_status] = false
      end 
    end
  end 
end 