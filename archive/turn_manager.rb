class TurnManager
  STARTING_FRAME = 1

  attr_reader :frame, :turn

  def initialize
    @frame = STARTING_FRAME
    @pins = []
  end

  # def move(number)
  #   if strike?(number)
  #     end_turn
  #   else
  #     return end_turn unless current_turn
  #     @turn += 1
  #   end
  # end

  def move(number)
    @pins << number
    if pins.sum < 10
      


  # def final(number)
  #   pins = 0
  #   if strike?(number)
  #     pins += number
  #     return end_turn if pins == 30
  #   else
  #     @turn += 2
  #     return end_turn if turn >= 3
  #   end
  #   return end_turn if turn >= 3
  # end

  private

  def end_turn
    @frame += 1
    @pins = STARTING_POINT
  end

  def strike?(number)
    number == 10
  end
end
