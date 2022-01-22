class Frames
  attr_reader :round

  def initialize
    @round = 0
    new_round
  end

  def new_round
    @round +=1
    @round >= 11 ? end_game : new_roll
  end

  def end_game
    # will call ScoreCard.new or whatever
  end

  def new_roll

  end

end