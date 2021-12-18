class Frame
  attr_reader :first_roll, :second_roll, :strike, :spare

  def initialize
    @first_roll = 0
    @second_roll = 0
    @strike = false
    @spare = false
  end
end