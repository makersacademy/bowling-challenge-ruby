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

  def compile_scorecard
    frame_counter = 0
    frames_array.collect do |frame|
      frame_counter += 1
      frame = "Frame #{frame_counter}: #{frame.score}"
    end
  end

  def print_scorecard
    compile_scorecard.join(', ')
  end

  def print_score
    frames_array.map{ |frame| frame = frame.score }.sum
  end

  def add_bonus_score(frame_index, roll)
    if frames_array[frame_index].bonus_rolls > 0
      frames_array[frame_index].add_score(roll)
      frames_array[frame_index].bonus_rolls -= 1
    end
  end

  def start_game
    # loop for first 9 frames
    for i in 0..8 do
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
        add_bonus_score(i-1, roll_1)
      end

      if i > 1
        add_bonus_score(i-2, roll_1)
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
        frames_array[i].bonus_rolls += 1 if roll_1 + roll_2 == 10
        if i > 0
          add_bonus_score(i-1, roll_2)
        end
      end
    end

    #insert  code for final frame here

    puts "Final Score = #{print_score}"
    puts "Final Scorecard:"
    puts print_scorecard


  end

end
