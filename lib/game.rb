require_relative 'frame'

class Game

  def initialize(scorecard)
    @scorecard = scorecard
  end

  def game
    @scorecard.title
    10.times { play(Frame.new); @scorecard.update(Frame.all) }
    play(Frame.final_frame) if Frame.final_frame_bonus?
    @scorecard.finish(Frame.all)
  end

  def play(frame)
    2.times { frame.roll = @scorecard.get_score unless frame.complete? }
    2.times { frame.roll = @scorecard.get_score if Frame.final_frame_bonus? }
  end
end