class Scorecard

  attr_reader :frame, :scorecard, :score

  def initialize
    @frame = 1
    @scorecard = {}
    @score = 0
  end

  def roll(number)
    if number > 10 || !(first_roll) && ((first_roll_score + number) > 10)
      raise 'This score is invalid'
    end
    # find out if frame is empty and if it is not then check it the number
    # plus what is already in it add up to more than 10
    @score += number
    if @scorecard[@frame.floor].nil?
      @scorecard[@frame.floor] = [number]   
    else
      @scorecard[@frame.floor] << number
    end

    @frame += 0.5
  end

  def first_roll
    @scorecard[@frame.floor].nil?
  end

  def first_roll_score
    @scorecard[@frame.floor].join.to_i
  end

  def print_scorecard
    @scorecard.each { |k, v| puts "Frame #{k} => Roll 1: #{v[0]}, Roll 2: #{v[1]}" }
    puts "Total score: #{@score}"
  end
end
