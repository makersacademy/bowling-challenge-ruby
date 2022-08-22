require_relative 'frame'

class BowlingScorecard
  def initialize(io = Kernel, frames = [])
    @io = io
    @frames = frames
  end

  def run(num_of_frames = 10)
    # num_of_frames is a variable for testing
    # standard game of bowling is ten frames
    frame_count = 0
    until frame_count == num_of_frames
      frame_count += 1
      @io.puts "Frame #{frame_count}"
      frame_loop
      print_scorecard
    end
  end

  def frame_loop
    # loops code twice for two rolls per frame
    # if a strike or spare is scored in the tenth frame the player gets a third roll
    current_frame = Frame.new(@io)
    roll_count = 1
    until roll_count == (current_frame.bonus_rolls.positive? ? 4 : 3)
      @io.puts "Enter roll #{roll_count} pinfall:"
      roll(current_frame)
      # if a strike is scored and it's not the tenth frame then frame finishes
      break if current_frame.rolls.sum == 10 && @frames.length != 9

      roll_count += 1
    end
    # push frame to @frames array
    @frames << current_frame
  end

  def roll(current_frame)
    # current_frame is a Frame instance
    # roll calculates logic for each roll
    pinfall = current_frame.pinfall_check(@frames.length)
    return unless @frames.length < 10
    # this adds bonus points to rolls with spares or strikes (checks for bonus rolls)
    @frames.each { |frame| frame.add_bonus_points(pinfall) if frame.bonus_rolls.positive? }
    # logic adds bonus rolls for bonus points if a spare or strike is scored 
    if pinfall == 10
      current_frame.bonus_rolls += 2
    elsif current_frame.rolls.sum == 10
      current_frame.bonus_rolls += 1
    end
  end

  def print_scorecard
    # prints the scorecard
    @scorecard_total = 0
    @frames.each_with_index do |frame, idx|
      @io.puts "Frame #{idx + 1}"
      @io.puts frame.format_roll
      @io.puts score_string(frame)
    end
  end

  private

  def score_string(frame)
    # frame is a Frame instance
    # returns a string of the score if bonus points are not being calculated
    # else returns an empty string 
    frame_total = @scorecard_total += frame.rolls.sum + frame.bonus_points
    frame.bonus_rolls.zero? || @frames.length == 10 ? "Score: #{frame_total}" : ''
  end
end

BowlingScorecard.new.run if __FILE__ == $PROGRAM_NAME
