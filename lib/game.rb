require_relative 'frame'

class Game

  attr_reader :turn, :current_frame
 
class << self

  def create
    Game.new
  end

end

  def initialize
    @turn = 0
  end

  def begin_frame
    @turn += 1
    @current_frame = Frame.new(turn)
    puts "frame #{turn}"
  end

  def mark_score(points)
    current_frame.add_roll(points)
  end

  def get_score
    current_frame.score[-1]
  end

  def clear_score
    current_frame.score.clear
  end

  def spare_or_strike?
    return "spare!" if current_frame.spare?
    return "strike!" if current_frame.strike?
  end

  def strike?
    current_frame.strike?
  end

  def roll_1(points)
    mark_score(points)
    spare_or_strike?
  end

  def roll_2(points)
    mark_score(points)
    spare_or_strike?
  end
  
end