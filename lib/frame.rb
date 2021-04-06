require_relative 'strike'
require_relative 'spare'

class Frame

  attr_reader :rolls, :special

  def initialize
    @rolls = []
    @special = []
  end

  def complete?
    return true if @special.any?
    return true if @rolls.length == 2
    false
  end

  def roll(pins)
    @rolls << pins
    if pins == 10
      @special << Strike.new
    elsif @rolls.sum == 10
      @special << Spare.new
    end
  end

end
