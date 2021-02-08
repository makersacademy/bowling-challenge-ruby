class BowlingGame
  attr_reader :frames, :in_turn, :total_score

  def initialize
    @frames = Array.new
    @in_turn = false
    @bowls = Array.new
    @total_score = 0
  end

  def roll(pins_downed)
    check_turn
    turn(pins_downed)
  end

  def check_turn
    if @in_turn == false
      @frames << Array.new
      @in_turn = true
    end
  end

  def turn(pins_downed)
    @in_turn = false if pins_downed == 10 || @frames[-1].count == 1 && @frames.count != 10
    add_score(pins_downed)
  end

  def add_score(pins_downed)
    score(pins_downed)
    @frames[-1] << pins_downed
  end

  def total_score
    @frames.each do |turn|
      if turn.count == 1
        bonus = 2
        @total_score += 10
      elsif
      end

    end
  end

end
