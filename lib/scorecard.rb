require_relative './frame'

class Scorecard
  def initialize()
    @total_score = []
    @frame = 0
  end

  def total_score
    return @total_score
  end

  def frame
    return @frame
  end

  def handle_spare
    frame = @total_score[@frame]
    frame.bonus(frame.roll_1)
  end

  def handle_strike
    frame = @total_score[@frame]
    frame.bonus(frame.roll_1 + frame.roll_2)
  end

  def handle_last_frame_strike
    roll_1, roll_2 = get_user_2_rolls("last_frame")
    @total_score[@frame].bonus(roll_1 + roll_2)
  end

  def get_last_user_roll
    puts "Enter the score for Frame 10, bonus roll 1"
    roll = gets.chomp.to_i
    return roll
  end

  def handle_last_frame_spare
    roll = get_last_user_roll
    @total_score[@frame].bonus(roll)
  end

  def handle_frame_bonus
    if @frame > 0 && @total_score[-2].is_strike
      handle_strike
    elsif @frame > 0 && @total_score[-2].is_spare
      handle_spare
    end
  end

  def handle_last_frame
    if (@total_score[@frame].is_strike)
      handle_last_frame_strike
    elsif (@total_score[@frame].is_spare)
      handle_last_frame_spare
    end
  end

  def run_frame
    roll_1, roll_2 = get_user_2_rolls("new_frame")
    @total_score[@frame] = Frame.new(roll_1, roll_2)
    handle_frame_bonus
    if (@frame == 9)
      handle_last_frame
    end
    print_score_message
    @frame += 1
  end

  def run
    while @frame < 10
      run_frame
    end
    return "your total score = #{@total_score}"
  end
end

private

def get_user_2_rolls(frame_label)
  puts "Enter the score for the 1st roll Frame ##{@frame+1}:"
  roll_1 = gets.chomp.to_i
  invalid_score_message if roll_1 > 10 
  if (roll_1 == 10) && @frame < 10
    roll_2 = 0
  else
    puts "Enter the score for the 2nd rol Frame ##{@frame+1}:"
    roll_2 = gets.chomp.to_i
    invalid_score_message if (roll_1 + roll_2) > 10
  end
  return roll_1, roll_2
end

def invalid_score_message
  puts "Please enter a valid score"
  return get_user_2_rolls
end

def print_score_message
  total = 0
  @total_score.each { |frame|
    total += frame.sum
  }
  puts "The score from Frame ##{@frame+1} = #{@total_score[@frame].sum}\nYour total score = #{total}"
end
