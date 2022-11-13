class Frame
  attr_reader :rolls, :game

  def initialize(game:)
    @game = game
    @rolls = []
  end

  def roll(pins)
    rolls << pins
  end

  def score
    if spare?
      rolls.sum + next_frame.rolls.first
    else
      rolls.sum
    end
  end

  def spare?
    @rolls.sum == 10
  end

  def next_frame
    game.next_frame(frame: self)
  end
end
