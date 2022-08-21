require_relative 'frame'

class Scorecard
  def initialize
    @frames = []
    @bonus_points = []
    @last_frame = Frame.new(0,0)
    @second_last_frame = Frame.new(0,0)
  end

  def add(frame)
    calc_bonus_points(frame)

    p @bonus_points

    @frames << frame
    @last_frame = @frames[-1]
    @second_last_frame = @frames[-2]
    return @frames
  end

  def calculate_score
    score = @frames.map { |frame| frame.sum }.sum + @bonus_points.sum

    if @frames.last.spare?
      "Spare! Your score: #{score} + next roll"
    elsif @frames.last.strike?
      "Strike! Your score: #{score} + next two rolls"
    else
      return "Your score: #{score}"
    end
  end

  def end_of_game?
    return @frames.length == 10
  end

  def calc_bonus_points(frame)
    if @last_frame.spare? && !end_of_game?
      @bonus_points.push(frame.roll_1)
    elsif @last_frame.strike? && !end_of_game?
      @bonus_points.push(frame.roll_1, frame.roll_2)
    # elsif @second_last_frame.strike? && @last_frame.strike? && !end_of_game?
    #   @bonus_points.push(@last_frame.roll_1, @last_frame.roll_2, frame.roll_1, frame.roll_2)
    end
  end
end