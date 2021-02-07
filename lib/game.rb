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
    post_roll_confirmation
  end 


  def frame_check
    if frames.empty? || frames[-1].frame_over?
      new_frame 
    end 

    if frames.length == 11
      raise 'Game finished'
    end 
  end 

  def total_score
    total_score = 0
    scores.each { |k, v| total_score += v }
    total_score
  end 

  def post_roll_confirmation
     "Current score: frame_#{frames.length} #{total_score}"
  end 
end
