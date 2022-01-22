require './lib/score_card'

class Frames
  attr_reader :round

  def initialize
    @round = 0
    new_round
    @score_card = ScoreCard.new
  end

  def new_round
    @round +=1
    @round >= 11 ? end_game : new_roll
  end

  def end_game
    @score_card.end_game
  end

  def new_roll

  end

end