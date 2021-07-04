
class Game
  attr_reader :pins_knocked_down, :pins, :frame_count, :consec_rolls, :roll_count 
  # attr_accessor :frame_count


  def initialize
    @frame_count = 0
    @consec_rolls = 0
    @roll_count = 1
  end

  def pins_knocked_down(number)
    if number == 10
      strike
    else
      number
    end
  end

  def strike
    'strike'
  end

  def frame_count
    @frame_count = @frame_count + 1
  end

  def rolls
    @consec_rolls += 1
  end

  # def strike?
  #   pins_knocked_down(10)
  #   if @pins == 10
  #     'strike'
  #   end
  # end


  # def roll_count
  #   return 1
  # end

  def roll
    @consec_rolls += 1
  end

end
