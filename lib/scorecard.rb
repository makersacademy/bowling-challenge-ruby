require 'player'

class ScoreCard

  attr_reader :score, :first_roll, :second_roll, :frame_number

  def initialize(player = Player.new, first_roll = true, frame_number = 1)
    @player = player
    @score = []
  end

end