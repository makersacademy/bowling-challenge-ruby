class Scoreboard
  def initialize(rolls)
    @rolls = rolls
    @score = 0
  end

  def strike?(pin)
    true if pin == 10
  end

  def spare?(pin1, pin2)
    true if pin1 + pin2 == 10
  end
end
