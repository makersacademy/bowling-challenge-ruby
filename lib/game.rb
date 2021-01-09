require_relative './frame.rb'

class Game

  FRAMES_PER_GAME = 10

  attr_reader :score

  def initialize
    @frames = (1..FRAMES_PER_GAME).to_a.collect{ |frame| frame = Frame.new }
    @score = 0
  end

  def frames_array
    @frames
  end

  def get_roll
    puts "How many pins did you knock down?:"
    STDIN.gets.chomp.to_i
  end

  def start_game
    for i in 0..0 do
      roll_1 = nil
      roll_2 = nil

      loop do
        roll_1 = get_roll
        break if roll_1 >= 0 && roll_1 <= 10
      end

      frames_array[i].add_score(roll_1)
      p frames_array[i].score
    end

  end

end
