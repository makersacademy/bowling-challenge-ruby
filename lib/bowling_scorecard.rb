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
    current_frame = Frame.new(@io)
    roll_count = 1
    until roll_count == (current_frame.bonus_rolls.positive? ? 4 : 3)
      @io.puts "Enter roll #{roll_count} pinfall:"
      roll(current_frame)
      break if current_frame.rolls.sum == 10 && @frames.length != 9

      roll_count += 1
    end
    @frames << current_frame
  end

  def roll(current_frame)
    pinfall = current_frame.pinfall_check(@frames.length)
    return unless @frames.length < 10

    @frames.each { |frame| frame.add_bonus_points(pinfall) }
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
      @io.puts frame.format_roll
      @io.puts score_string(frame)
    end
  end

  private

  def score_string(frame)
    frame_total = @scorecard_total += frame.rolls.sum + frame.bonus_points
    frame.bonus_rolls.zero? || @frames.length == 10 ? "Score: #{frame_total}" : ''
  end
end

if __FILE__ == $0
  BowlingScorecard.new.run
end
