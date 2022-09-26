class LastFrame < Frame
  attr_accessor :third_roll

  def initialize
    super
    @third_roll = nil
  end

  def second_strike?
    @second_roll == 10
  end
end