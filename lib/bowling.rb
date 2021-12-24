class Bowling

  attr_reader :score

  def initialize
    @score = []
    @frame = 1
    @roll = 1
  end

  def enter_score(pins)
    raise 'Outside of Range' unless valid_score?(pins)
    score << pins
    @roll = 2
  end

  def total_score
    "TOTAL: " + @score.reduce(:+).to_s
  end

  def game
    until @frame == 11
      puts "Enter how many pins you knocked down:"
      pins = gets.chomp.to_i
      enter_score(pins)
      @frame += 1
    end
    total_score
  end

  def valid_score?(pins)
    (0..10).include? pins
  end
end