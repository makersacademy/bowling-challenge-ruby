class Game
  def initialize(rolls)
    game = 9.times.map { rolls[0] == 10 ? rolls.shift(1) : rolls.shift(2) }
    game  << rolls.shift(rolls.length)
    @game = game.map { |frame| Frame.new(frame) }
  end

  def frames
    @game
  end

  def next_roll(fr_num)
    @game[fr_num].to_a[0] if fr_num < 10
  end

  def next_two(fr_num)
    return @game[fr_num + 1].to_a[0] if @game[fr_num].nrolls == 1 && fr_num < 10
    @game[fr_num].to_a[1] if fr_num < 10
  end
end