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
      running_total += score_frame(frame: frame, index: i)
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

  def score_frame(frame: ,index: )
    if frame.strike?
      score_strike(index: index)
    elsif frame.spare?
      score_spare(index: index)
    else
      score_standard(index: index)
    end
  end

  def score_strike(index: )

  end

  def score_spare(index: )
    frame_subset = scorecard[index..index+1]
    rolls_subset = frame_subset.map { |frame| frame.rolls }
    rolls_subset.flatten!
    rolls_subset[0..2].sum
  end

  def score_standard(index:)
    scorecard[index].total
  end

end