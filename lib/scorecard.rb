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


  def print_scorecard
    @scorecard.each { |k, v| puts "Frame #{k} => Roll 1: #{v[0]}, Roll 2: #{v[1]}" }
    puts "Total score: #{@score}"
  end
end
