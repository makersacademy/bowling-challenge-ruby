# frozen_string_literal: true
require_relative 'frame'

class Game
  attr_reader :frames, :scores, :running_total, :score_list, :roll

  def initialize
    @frames = []
    @score_list = []
    @scores = []
    @running_total = 0
  end

  def input_bowl(pins)
    @scores = {:frame => frames.length, :pins => pins}
    @score_list << scores

    if frames.empty?
      frames << Frame.new(frames.length + 1)
    end
    if strike? || frames[-1].open == false
      frames << Frame.new(frames.length + 1)
      
    end
    frames[-1].add_roll(pins)
  end

  def calculate_score
    @running_total = 0
    @score_list.each do |x| @running_total +=  x[:pins] end
  end

  def strike?
    @scores[:pins] == 10
  end
end
