# frozen_string_literal: true

require_relative 'frame'
require_relative 'bonus'

class Game
  attr_reader :frames, :score, :roll, :bonuses

  def initialize
    @frames = []
    @running_total = 0
    @bonuses = []
  end

  def input_bowl(pins)
    bonus(pins) if frames.any? && frames[-1].bonus
    puts 1
    raise "Game over" if over?
    puts 2

    frames << Frame.new(frames.length + 1) if add_frame?
    puts 3

    frames[-1].add_roll(pins)
    puts 4
    puts "You knocked down #{pins} pins, and your score is #{score}!"
  end

  def score
    @score = 0
    @frames.each { |x| @score += x.rolls.sum }
    @bonuses.each { |x| @score += x.extra }
    @score
  end

  def add_frame?
    frames.empty? || frames[-1].open == false
  end

  def over?
    frames.length == 10 && !frames[-1].open
  end

  def bonus(pins)
    @bonuses << Bonus.new(frames[-1].bonus) if bonuses.length < 10
    @bonuses.each { |bonus| bonus.per_roll(pins) if bonus.status > 0}
  end

  def message(pins)
    "You knocked down #{pins} pins, and your score is #{score}!"
  end
end
