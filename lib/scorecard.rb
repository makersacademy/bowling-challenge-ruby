require_relative 'frame'
require_relative 'bonus_roll'
class ScoreCard
  def initialize
    @score = []
  end

  def add(frame)
    @score << frame.frame_to_hash
  end


  def calculate_bonuses
    check_spare_bonus
    check_strike_bonus
  end

  def display_score
    calculate_bonuses
    return @score
  end

  def final_score
    @final_score = 0
    @score.each do |frame|
      @final_score += frame[:frame_total]
    end
    return @final_score
  end

  def add_final_frame_bonus(bonus_roll)
  
    if @score.length == 10 && @score[-1][:is_spare?] == true
      @score[-1][:frame_total] += bonus_roll.roll_one
      @score[-1][:bonus_status] = false
    elsif @score.length == 10 && @score[-1][:is_strike?] == true
      @score[-1][:frame_total] += bonus_roll.roll_one + bonus_roll.roll_two 
      @score[-1][:bonus_status] = false
    else raise ("bonus rolls can only be added to the 10th frame")
    end
  end
end

private

def check_spare_bonus
  @score.each_with_index do |frame, index|
    if @score.length == 10 && frame == @score.last then return nil
    elsif frame[:is_spare?] == true && frame[:bonus_status] == true
      next_frame = @score[index + 1]
      frame[:frame_total] += next_frame[:roll_one]
      frame[:bonus_status] = false
    end
  end
end

def check_strike_bonus
  @score.each_with_index do |frame, index|
    if @score.length == 10 && frame == @score.last then return nil
    elsif frame[:is_strike?] == true && frame[:bonus_status] == true
      next_frame = @score[index + 1]
      frame_after_next = @score[index + 2]
      if next_frame[:is_strike?]
        frame[:frame_total] += next_frame[:roll_one] + frame_after_next[:roll_one]
        frame[:bonus_status] = false
      else
        frame[:frame_total] += next_frame[:roll_one] + next_frame[:roll_two]
        frame[:bonus_status] = false
      end
    end
  end
end
