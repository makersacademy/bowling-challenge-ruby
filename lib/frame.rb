class Frame
  attr_reader :first_roll, :second_roll, :strike, :spare

  def initialize(first_roll, second_roll)
    @first_roll = first_roll
    @second_roll = second_roll
    @strike = is_strike
    @spare = is_spare
  end

  private

  def is_strike
    @first_roll == 10
  end

  def is_spare
    @first_roll + @second_roll == 10 && @first_roll != 10
  end
end
 