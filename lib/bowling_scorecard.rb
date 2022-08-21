require_relative 'frame'

class BowlingScorecard
  def initialize(io = Kernel, frames = [])
    @io = io
    @frames = frames
  end

  def run(num_of_frames = 10)
    frame_count = 0
    until frame_count == num_of_frames
      frame_count += 1
      @io.puts "Frame #{frame_count}"
      frame_loop
      print_scorecard
    end
  end

  def frame_loop
    current_frame = Frame.new
    roll_count = 1
    until roll_count == 3 || current_frame.rolls.sum == 10
      @io.puts "Enter roll #{roll_count} pinfall:"
      roll(current_frame)
      roll_count += 1
    end
    @frames << current_frame
  end

  def roll(current_frame)
    pinfall = pinfall_check(current_frame)
    add_bonus_points(pinfall)
    current_frame.rolls << pinfall
    if pinfall == 10
      current_frame.bonus_rolls += 2
    elsif current_frame.rolls.sum == 10
      current_frame.bonus_rolls += 1
    end
  end

  def print_scorecard
    @scorecard_total = 0
    @frames.each_with_index do |frame, idx|
      @io.puts "Frame #{idx + 1}"
      @io.puts format_roll(frame)
      @io.puts "#{score_string(frame)}\n"
    end
  end

  private

  def pinfall_check(frame)
    loop do
      value = @io.gets.to_i
      max_value = max_value_check(frame)
      return value unless value > max_value

      @io.puts "Please enter a value of #{max_value} or less"
    end
  end

  def max_value_check(frame)
    if @frames.length == 9 && frame.rolls[0] == 10
      return 10 if frame.rolls.sum == 20

      return 10 - frame.rolls[1, 2].sum
    end
    10 - frame.rolls.sum
  end

  def add_bonus_points(pinfall)
    @frames.each do |frame|
      if frame.bonus_rolls.positive?
        frame.bonus_rolls -= 1
        frame.bonus_points += pinfall
      end
    end
  end

  def score_string(frame)
    frame_total = @scorecard_total += frame.rolls.sum + frame.bonus_points
    frame.bonus_rolls.zero? ? "Score: #{frame_total}" : ''
  end

  def format_roll(frame)
    return 'X' if frame.rolls[0] == 10

    frame.rolls.map.with_index do |roll, idx|
      roll = '/' if idx == 1 && frame.rolls.sum == 10
      roll.to_s
    end.join(' ')
  end
end
