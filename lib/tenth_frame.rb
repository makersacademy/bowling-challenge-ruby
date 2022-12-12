require_relative './frame'

class TenthFrame < Frame
  attr_reader :first_roll, :second_roll, :third_roll
  def initialize(first_roll, second_roll, third_roll)
    @first_roll = first_roll
    @second_roll = second_roll
    @third_roll = third_roll
  end
end