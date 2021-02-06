require_relative "frame"

class Game

  attr_reader :frames, :scores

  def initialize
    @frames = []
    @scores = Hash.new
  end

  def create_frame
    frames << Frame.new(frames.length + 1)
    scores["frame_#{frames.length}".to_sym] = 0
  end

  def input_roll(pins)
    raise "Game is finished" if frames.length == 10 && frames[-1].completed?
    if frames.empty? || frames[-1].completed?
      create_frame
    end
    frames[-1].add_roll(pins)


  end

end
