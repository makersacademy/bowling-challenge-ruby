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
end
