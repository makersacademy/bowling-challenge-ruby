class TurnManager
  STARTING_POINT = 1

  attr_reader :frame

  def initialize
    @frame = STARTING_POINT
    @turn = STARTING_POINT
  end

  def move(number)
    if @turn < 2
      if number < 10
        @turn += 1
      else
        @turn += 2
        @frame += 1
      end
    else
      @turn = STARTING_POINT
      @frame += 1
    end
  end
end
