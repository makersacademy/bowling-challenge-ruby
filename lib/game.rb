require_relative 'scorecard'
require_relative 'frame'
require_relative 'roll'

class Game
  attr_reader :scorecard, :current_frame, :frames, :roll_count

  def initialize
    @scorecard = Scorecard.new
    @current_frame = Frame.new
    @frames = [@current_frame]
    @roll_count = 0
  end

  def roll(pins)
    roll = Roll.new(pins)
    @current_frame.rolls << roll
    @scorecard.update(@current_frame, @frames)
    update_frame
  end

  def update_frame
    @roll_count += 1

    if @current_frame.rolls.size == 2 || @current_frame.rolls.map(&:score).sum >= 10
      @current_frame = Frame.new
      @frames << @current_frame
    end
  end
end