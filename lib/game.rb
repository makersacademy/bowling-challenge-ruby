class Game

  attr_reader :total_score

  def initialize
    @total_score = 0
  end

  def self.play
    Game.new
  end

  def bowl(score)
    @total_score += score
    p @total_score
  end


end
