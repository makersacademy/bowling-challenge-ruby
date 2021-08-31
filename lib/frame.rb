class Frame
  attr_reader :first_roll, :number
  attr_accessor :second_roll

  def initialize(scorecard, number, first_roll)
    @number = number
    @first_roll = first_roll
    @second_roll = nil
    @scorecard = scorecard
  end
end
