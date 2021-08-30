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
    raise "Game over. Final score: #{@score}" if gameover?

    @frames.each do |frame|
      if frame.rolls_remaining > 0
        frame.add_roll(pins)
      end
    end
    check_frameover
    add_frame
  end

  def add_frame
    if @frames.last.strike? || @frames.last.current_roll == 2
      @frames << Frame.new unless frames.length == 10
    end
  end

  def check_frameover
    @frames.each do |frame|
      if frame.closed == false && frame.frameover?
        @frame_scores << frame.frame_score
        @score += frame.frame_score
        frame.closed = true
      end
    end
  end
  
  def gameover?
    @frame_scores.length == 10 ? true : false
  end
end
