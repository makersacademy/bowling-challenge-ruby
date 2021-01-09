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

  def ask_roll
    puts "How many pins did you knock down?:"
  end

  def get_roll
    STDIN.gets.chomp.to_i
  end

  def start_game
    for i in 0..2 do
      p frames_array
      puts "Frame number: #{i + 1}"
      puts "Roll number: 1"
      puts "Game score: #{self.score}"
      roll_1 = nil
      roll_2 = nil

      loop do
        ask_roll
        roll_1 = get_roll
        break if roll_1 >= 0 && roll_1 <= 10
      end

      frames_array[i].add_score(roll_1)

      if i > 0
        if frames_array[i-1].bonus_rolls > 0
          frames_array[i-1].add_score(roll_1)
          frames_array[i-1].bonus_rolls -= 1
        end
      end

      if i > 1
        if frames_array[i-2].bonus_rolls > 0
          frames_array[i-2].add_score(roll_1)
          frames_array[i-2].bonus_rolls -= 2
        end
      end

      if roll_1 == 10
        frames_array[i].bonus_rolls += 2
      else
        loop do
          p frames_array
          puts "Frame number: #{i + 1}"
          puts "Roll number: 2"
          puts "Game score: #{self.score}"
          ask_roll
          roll_2 = get_roll
          break if roll_2 >= 0 && roll_2 <= (10 - roll_1)
        end
        frames_array[i].add_score(roll_2)
        # # insert conditional here to only check if i > 1 (not needed for first frame)
        # if self.frames[i-1].bonus_rolls > 0
        #   self.frames[i-1].add_score(roll_1)
        #   self.frames[i-1].remove_bonus_roll
        # end
      end
    end

  end

end
