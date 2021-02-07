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
    if frames[-1].frame_over? && previous_strike?
      strike_score 
      total_score += frames[-2].bonus
    elsif previous_spare?
      spare_score
      total_score += frames[-2].bonus
    else 
      total_score 
    end 
  end 

  def post_roll_confirmation
    if frames.length < 10
     "Current score: frame_#{frames.length} #{total_score}"
    elsif frames.length == 10 && !frames[-1].frame_over?
      "Current score: frame_#{frames.length} #{total_score}"
    elsif frames.length == 10 && frames[-1].frame_over?
      "Final score: #{total_score}"
    end 
  end 

  def previous_spare?
    frames.length == 2 ? frames[-2].spare? : false
  end 

  def previous_strike?
    frames.length == 2 ? frames[-2].strike? : false
  end 

  def spare_score
    frames[-2].add_bonus(frames[(-1)].rolls[0])
  end 

  def strike_score
    bonus = (frames[(-1)].rolls[0]) + (frames[(-1)].rolls[1])
    frames[-2].add_bonus(bonus)
  end 
end
