require_relative 'turn_manager'
require_relative 'score_calculator'

class BowlingGame
  MAX_FRAMES = 10
  def initialize(turn_manager = TurnManager.new, score = ScoreCalculator.new)
    @turn_manager = turn_manager
    @current_score = score
  end

  def start
    loop do
      break if check_frame > MAX_FRAMES 
      puts "Please enter your score for frame #{check_frame}, turn #{check_turn}:"
      roll(gets.chomp.to_i)
      if check_frame == MAX_FRAMES
        loop do
          final(gets.chomp.to_i)
          break if check_frame > MAX_FRAMES
        end
      end
    end
  end

  private

  def roll(number)
    @turn_manager.move(number)
  end

  def final(number)
    @turn_manager.final(number)
  end

  def check_frame
    @turn_manager.frame
  end

  def check_turn
    @turn_manager.turn
  end
end
