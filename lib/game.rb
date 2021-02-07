class Game

  attr_reader :throws

  def initialize()
    @throws = []
  end

  def add(pins)
    @throws << pins
  end

end
