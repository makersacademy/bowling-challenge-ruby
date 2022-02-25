class Score
  attr_reader :game

  def initialize(game)
    @game = game
    @total = 0
  end

  def add_to_total
    current_frame = @game.frames[-1]
    prev_frame = @game.frames[-2]
    res = current_frame.reduce(0, :+)
    @total += @game.spare?(prev_frame) || @game.strike?(prev_frame) ? (res + add_bonus(current_frame)) : res
  end

  def add_bonus(current_frame)
    @game.spare?(@game.frames[-2]) ? current_frame[0] : (current_frame[0] + current_frame[1])
  end
end
