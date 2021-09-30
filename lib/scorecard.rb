class Scorecard
  attr_reader :running_score, :player, :card, :index

  def initialize(running_score = 0, player = 'Lilly')
    @running_score = running_score
    @player = player
    @card = []
    @index = 0
  end

end