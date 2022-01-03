class Bowling2

  attr_reader :turn, :frame

  def initialize
    @turn = 1
    @frame = 1
  end

  def input(pins)
    increase_turn
  end

  def increase_turn
    if @turn == 1
      @turn += 1
    else 
      increase_frame
      @turn = 1
    end
  end

  def increase_frame
    @frame += 1
  end

end