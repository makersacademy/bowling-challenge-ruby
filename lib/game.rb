class Game 

  attr_reader :frame, :roll, :pins_rolled

  def initialize
    @frame = 1
    @roll = 1
    @pins_rolled = Array.new(10) {Array.new}
  end

  def total_score
    0
  end

  def roll_pin(pin)
    @pins_rolled[@frame-1].push(pin)
    @frame += 1 if @roll == 2
    @roll == 1 ? @roll += 1 : @roll = 1
  end

end
