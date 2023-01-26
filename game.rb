require_relative 'score_card'
require_relative 'frame'

class Game
  def initialize

  end

  def play_game
    round = 1
    my_score_card = ScoreCard.new
    my_score_card.new_frame(round)
    p my_score_card.new_frame(round)
    roll_1 = random_num
    p "roll 1: #{roll_1}"
    roll_2 = random_num
    p "roll 1: #{roll_2}"
    my_score_card.add_to_total(roll_1)
    p my_score_card.total_score
    my_score_card.add_to_total(roll_2)
    p my_score_card.total_score

  end

  def random_num
    rand(11)
  end


end

my_game = Game.new
my_game.play_game