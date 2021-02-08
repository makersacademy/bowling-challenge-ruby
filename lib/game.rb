# frozen_string_literal: true

require_relative 'frame'

class Game
  attr_reader :frames, :scores, :running_total, :score_list, :roll, :bonuses

  def initialize
    @frames = []
    @score_list = []
    @scores = []
    @running_total = 0
    @bonuses = []
  end

  def input_bowl(pins)
    raise "Game over" if over?
    @scores = { frame: frames.length, pins: pins }
    @score_list << scores

    frames << Frame.new(frames.length + 1) if add_frame?

    frames[-1].add_roll(pins)
    @bonuses << [frames.length, frames[-1].bonus] if frames[-1].bonus
  end

  def calculate_score
    @running_total = 0
    @score_list.each { |x| @running_total += x[:pins] }
    add_bonus
  end

  def add_bonus
  #@bonus.each { |x| @running_total += x[:pins] }
  end

  def bonus?
    frames[-1].strike? || frames[-1].spare?
  end


  def add_frame?
    frames.empty? || frames[-1].open == false
  end

  def over?
    frames.length == 10 && !frames[-1].open
  end
end
