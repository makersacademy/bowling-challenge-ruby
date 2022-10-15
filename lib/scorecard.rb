require 'roll'

class Scorecard
  def initialize
    @rolls_arr = []
  end

  def add(roll)
    @rolls_arr << roll
  end

  def rolls_arr
    @rolls_arr
  end
end