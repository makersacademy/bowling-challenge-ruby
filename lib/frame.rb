class Frame
  attr_reader :score

  def initialize
    @score = 0
  end

  def add_roll(pins)
    self.score += pins
  end

  private

  attr_writer :score
end
