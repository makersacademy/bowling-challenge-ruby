class Scoreboard

  attr_reader :score, :frame_score

  def initialize
    @frames = 1
    @frame_score = []
    @score = []
  end

  def first_roll
    puts "What's the score on your first roll?"
    roll_1 = gets.chomp.to_i
    @frame_score << roll_1
    @score << roll_1
  end

  def second_roll
    puts "What's the score on your second roll?"
    roll_2 = gets.chomp.to_i
    @frame_score << roll_2
    @score << roll_2
    @frames += 1
  end
end
