require 'frame'

class Scorecard
  def initialize
    @frames = []
  end

  def add_frame(*scores)
    @frames << Frame.new(*scores)
  end

  def calculate_score
    @frames[0..9].reduce(0) { |sum, frame| sum + get_frame_score(frame) }
  end

  def perfect_game?
    calculate_score == 300
  end

  def gutter_game?
    calculate_score == 0
  end

  private

  def get_frame_score(frame)
    i = @frames.index(frame)
    score = @frames[i].scores.sum
    return score + get_next_roll(i) if frame.spare?
    return score + get_next_two_rolls(i) if frame.strike?
    return score
  end

  def get_next_roll(current_frame_index)
    @frames[current_frame_index + 1].scores.first
  end
  
  def get_next_two_rolls(current_frame_index)
    score = get_next_roll(current_frame_index)
    if @frames[current_frame_index + 1].scores.length == 1
      return score + @frames[current_frame_index + 2].scores.first
    else
      return score + @frames[current_frame_index + 1].scores.last
    end
  end
end
