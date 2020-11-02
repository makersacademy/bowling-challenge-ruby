class Game

  attr_reader :frames

  def initialize
    @frames = []
  end

  def roll(number)
    last_ball?
    if add_new_frame? || strike?
      frame = Frame.new
      frame.roll(number)
      frames.push(frame)
    else
      frame = frames.last
      frame.roll(number)
    end
  end

  def current_score
    score = frames.inject(0) { |sum, frame|
      sum + frame.frame_score
    }
  end

  private
  def add_new_frame?
    frames.empty? || frames.last.rolls.nil? || frames.last.rolls.length == 2
  end

  def strike?
    frames.last.strike
  end

  def last_ball?
    fail 'last ball' if normal_end? || three_strikes? || spare_in_10th
  end

  def normal_end?
    frames.length == 10 && frames.last.pins_left != 0 && frames.last.rolls.length == 2
  end

  def three_strikes?
    frames.length == 12
  end

  def spare_in_10th
    frames.length == 11 && frames.last.rolls.length == 1 && frames[9].rolls.length == 2
  end

  def bonus_for_strike

  end

  def bonus_for_spare

  end
end
