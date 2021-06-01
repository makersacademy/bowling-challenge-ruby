class Frame
  attr_reader :value

  def initialize
    @value = 0
    @complete = false
    @pending_count = 0
    @throws = []
  end

  def process_input(pins_knocked:, frame_num:)
    @value += pins_knocked
    @throws << pins_knocked
    spare(frame_num) if @value == 10 && @throws.length == 2
    strike(frame_num) if pins_knocked == 10
    @complete = true if @throws.length == 2 && frame_num != 10
    @complete = true if @throws.length == 2 and @throws.sum != 10
    @complete = true if @throws.length == 3
  end

  def update_value(pins_knocked:)
    return unless @pending_count > 0
    @value += pins_knocked
    @pending_count -= 1
  end 
  
  def complete?
    @complete
  end
  
  private 

  def strike(frame_num)
    @pending_count = 2
    @complete = true if frame_num != 10
    @complete = true if frame_num == 10 && @throws.length == 3
  end

  def spare(frame_num)
    @pending_count = 1
    @complete = true
  end
end 