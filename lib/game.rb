require_relative 'frame'

class Game

  attr_reader :scorecard

  def initialize(frame: Frame.new)
    @scorecard = [frame]
  end

  def roll(pins)
    frame_complete?
    scorecard.last.roll(pins)
  end

  def score
    running_total = 0
    scorecard.each_with_index { |frame, i|
     running_total += frame.total
    }
    running_total
  end

  def frame_complete?
    if scorecard.last.complete?
      new_frame
    end
  end

  def new_frame(frame: Frame.new)
    scorecard << frame
  end

end