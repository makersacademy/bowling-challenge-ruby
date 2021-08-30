require_relative 'frame'

class Game 
  attr_reader :score, :frames, :frame_scores

  def initialize 
    @score = 0
    @frames = [Frame.new]
    @frame_score = 0
    @frame_scores = []
  end

  def roll(pins)
    @frames.each do |frame|
      if frame.rolls_remaining > 0
        frame.add_roll(pins)
      end
    end
    check_frameover
  end

  def add_frame
    @frames << Frame.new unless frames.length == 10
  end

  def check_frameover
    @frames.each do |frame|
      if frame.frameover?
        @frame_scores << frame.frame_score
        @score += frame.frame_score
      end
    end
  end
  
  def gameover?
    @frame_scores.length == 10 ? true : false
  end
end
