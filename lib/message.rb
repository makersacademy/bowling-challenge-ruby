class Message
  attr_reader :score, :pins
  def initialize(score, pins)
    @score = score
    @pins = pins
  end
end
