class Scorecard
  def initialize
    @frames = [Frame.new]
    @current_frame = 1
    @total_score = 0
  end

  def add_roll(pins)
    current_frame.add_roll(pins)

    if current_frame.strike? || current_frame.rolls.size == 2
      @frames << Frame.new
      @current_frame += 1
    end
  end

  def current_frame
    @frames[@current_frame - 1]
  end

  def score
    @frames.take(10).each_with_index.sum do |frame, index|
      frame_score = frame.score
      if frame.strike?
        next_frame = @frames[index + 1]
        frame_score += next_frame.score
        frame_score += next_frame.rolls[1] if next_frame.strike?
      elsif frame.spare?
        next_frame = @frames[index + 1]
        frame_score += next_frame.rolls.first
      end
      frame_score
    end
  end

  def total_score
    if @total_score == 0
      return "Gutter Ball!"
    elsif @total_score == 300
      return "Perfect Score!"
    else
      return @total_score
    end
  end
end