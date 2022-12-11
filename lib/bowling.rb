# frozen_string_literal: true

class BowlingGame
  def initialize(io = Kernel, rolls = [])
    @rolls = rolls
    @current_roll_index = 0
    @io = io
  end

  def score
    total_score = 0
    frame_num = 1
    10.times do
      if strike?
        total_score += 10 + strike_bonus
        @current_roll_index += 1
      elsif spare?
        total_score += 10 + spare_bonus
        @current_roll_index += 2
      else
        total_score += frame_total
        @current_roll_index += 2
      end
      @io.puts "Score after Frame #{frame_num}: #{total_score}"
      frame_num += 1
    end
    total_score
  end

  def input_score_for_frames
    intro_message
    frame_num = 1
    10.times do
      @io.puts "What was you score for Frame #{frame_num}?"
      pins_knocked_input = @io.gets.chomp
      if pins_knocked_input.include? ','
        frame_array = pins_knocked_input.split(',')
        frame_array.each { |pins_knocked_down| roll(pins_knocked_down.to_i) }
      else
        roll(pins_knocked_input.to_i)
      end
      frame_num += 1
    end
    @io.puts "You final score for this game was: #{score}"
  end

  private

  def intro_message
    @io.puts 'Input the score for each frame...'
    @io.puts 'If you scored a strike simply input 10'
    @io.puts 'Otherwise input 2 numbers seperated by a comma'
    @io.puts 'Examples:'
    @io.puts '4,3 if you knocked 4 pins followed by 3'
    @io.puts 'or'
    @io.puts '3,7 if you knocked 3 pins followed by 7'
    @io.puts 'Final frame could be 1. if you get strikes or 2. if you get a spare or 3. if not a strike or a spare:'
    @io.puts '1. 10,10,10'
    @io.puts 'or'
    @io.puts '2. 3,7,5'
    @io.puts 'or'
    @io.puts '3. 4,3'
  end

  def roll(pins_knocked_down)
    @rolls << pins_knocked_down
  end

  def strike?
    @rolls[@current_roll_index] == 10
  end

  def spare?
    @rolls[@current_roll_index] + @rolls[@current_roll_index + 1] == 10
  end

  def strike_bonus
    @rolls[@current_roll_index + 1] + @rolls[@current_roll_index + 2]
  end

  def spare_bonus
    @rolls[@current_roll_index + 2]
  end

  def frame_total
    @rolls[@current_roll_index] + @rolls[@current_roll_index + 1]
  end
end

# game = BowlingGame.new
# game.input_score_for_frames
