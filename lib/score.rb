class Score
  attr_reader :game

  def initialize(game)
    @game = game
    @total = 0
  end

  def get_total(current_frame)
    result = current_frame.reduce(0, :+)
    @total += if @game.spare?(@game.frames[-2]) || @game.strike?(@game.frames[-2])
                (result + add_bonus(current_frame))
              else
                result
              end
  end

  def add_bonus(current_frame)
    @game.spare?(@game.frames[-2]) ? current_frame[0] : current_frame.reduce(0, :+)
  end
end
