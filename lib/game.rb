class Game
  def initialize
    @frames = Array.new(10){ Frame.new }
    @active_frame = 0
    @total_score = 0
  end

  def take_turn(pins_knocked)
    @frames.each { |frame| frame.update_value(pins_knocked: pins_knocked) }
    @frames[@active_frame].process_input(pins_knocked: pins_knocked, frame_num: @active_frame + 1)
    finished if @frames[@active_frame].complete? && @active_frame == 9
    @active_frame += 1 if @frames[@active_frame].complete?
  end

  def finished
    @frames.each { |frame| @total_score += frame.value }
    @total_score
  end

end
