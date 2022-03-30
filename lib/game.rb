require_relative 'frame'

class Game
  MAX_ROLLS = 20

  attr_reader :frame, :rolls

  def initialize
    @frame = Frame.new
    @rolls = 0
  end

  def first_roll(pin)
    @frame.add_first_roll(pin)
    @rolls += 1
    #frame_score(@frame.current_frame)
  end

  def second_roll(pin)
    @frame.add_first_roll(pin)
    @rolls += 1
  end

  # def frame_score(turn)
  #   if @frame.complete?
  #     @frame.frames[@frame.current_frame - 1]
  #   else
  #     "Please play second_roll"
  #   end
  # end
end