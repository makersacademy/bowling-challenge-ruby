class Frame
  attr_reader :first_roll, :number
  attr_accessor :second_roll

  def initialize(scorecard, number, first_roll)
    @number = number
    @first_roll = first_roll
    @second_roll = nil
    @scorecard = scorecard
  end

  def after() = @scorecard.scores[@number]

  def after_next() = after.after

  def base_score() = [@first_roll, @second_roll].compact.sum
      
  def boring?() = !(strike? || spare?)
  
  def spare?() = base_score == 10 && two_rolls?
  
  def strike?() = @first_roll == 10

  private

  def two_rolls?() = @second_roll != nil
end
