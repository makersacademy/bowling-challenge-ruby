require_relative 'frame'

class BowlingScorecard

  def initialize(io = Kernel, frames = [])
    @io = io
    @frames = frames
  end

  def roll(frame)
    pinfall = pinfall_check(frame)
    frame.rolls << pinfall
    if pinfall == 10
      frame.bonus_rolls += 2
    elsif frame.rolls.sum == 10
      frame.bonus_rolls += 1
    end
  end

  def frame_loop
    current_frame = Frame.new
    roll_count = 1
    until roll_count == 3
      @io.puts "Enter roll #{roll_count} pinfall:"
      roll(current_frame)
      roll_count += 1
    end
    @frames << current_frame
  end

  def print_scorecard
    total = 0
    @frames.each_with_index do |frame, idx|
      @io.puts "Frame #{idx + 1}"
      @io.puts frame.rolls.map(&:to_s).join(" ")
      @io.puts "Score: #{total += frame.rolls.sum}\n"
    end
  end

  private

  def pinfall_check(frame)
    loop do
      value = @io.gets.to_i
      max_value = 10 - frame.rolls.sum
      return value unless value > max_value

      @io.puts "Please enter a value of #{max_value} or less"
    end
  end
end
