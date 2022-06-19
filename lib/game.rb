class Game 

  attr_reader :frame, :roll, :pins_rolled, :continue

  def initialize
    @frame = 1
    @roll = 1
    @continue = true
    @pins_rolled = Array.new(10) {Array.new}
    @scores = Array.new(10){0}
  end

  def score
    @scores.sum
  end

  def roll_pin(pin)
    @pins_rolled[@frame-1].push(pin)
    @scores[@frame-1] += pin # adding pin number as scores.... definitely need more calculations
    @continue = false if (@frame == 10) && (@roll == 2) && (@pins_rolled[9].sum <10)
    @continue = false if (@frame == 10) && (@roll == 3)
    if @continue == true
      if @frame == 10
        @roll += 1
      elsif pin < 10
        @frame += 1 if @roll == 2
        @roll == 1 ? @roll += 1 : @roll = 1
      elsif pin == 10 && @roll == 1
        @frame += 1
      end
    end
  end
end
