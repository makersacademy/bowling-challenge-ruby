class Frames
  def initialize
    @frame = 0
  end

  def increment_frame
    @frame += 1
  end

  def current_frame
    @frame
  end

  def roll_1(pins_knocked_down)
    # pins knocked down from user (values are 0 to max 10)
    if pins_knocked_down <= 10 and pins_knocked_down > 0
      return pins_knocked_down.to_i
    else
      fail "Roll input is incorrect! It must be a value between 0 and 10 (inclusive)"
    end
  end

  def roll_2(pins_knocked_down)
    if pins_knocked_down <= 10 and pins_knocked_down > 0
      return pins_knocked_down.to_i
    else
      fail "Roll input is incorrect! It must be a value between 0 and 10 (inclusive)"
    end
  end

  #def bonus(player, current_frame)
    # calculates the bonus based on the next frame rolls (F+1 R1 and R2)
  #end

  #def accumulated_score(player)
    # calculates the accumulated score
  #end
end
