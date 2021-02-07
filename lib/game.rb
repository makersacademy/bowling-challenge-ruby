# frozen_string_literal: true

require_relative 'frame'

class Game
  attr_reader :frames, :scores

  def initialize
    @frames = []
    @scores = {}
  end

  def new_frame
    frames << Frame.new(frames.length + 1)
    scores["frame#{@frames.length}".to_sym] = 0
  end

  def latest_roll(pins)
    frame_check 
    frames[-1].add_roll(pins)
    scores["frame#{@frames.length}".to_sym] += pins 
  end 


  def frame_check
    if frames.empty? || frames[-1].frame_over?
      new_frame 
    end 
  end 
end
