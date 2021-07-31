class Scorecard

  attr_reader :frame, :scorecard, :score

  def initialize
    @frame = 1
    @scorecard = {}
    @score = 0
  end

  def roll(number)
    raise 'This score is invalid' if number > 10
    @score += number
    if @scorecard[@frame.floor].nil?
      @scorecard[@frame.floor] = [number]   
    else
      @scorecard[@frame.floor] << number
    end

    @frame += 0.5
  end
end