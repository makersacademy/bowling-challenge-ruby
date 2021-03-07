class ErrorChecker
  def initialize(pins:, current_bowl:, current_frame:, open_frame:)
    @pins = pins
    @current_bowl = current_bowl
    @current_frame = current_frame
    @open_frame = open_frame
    run
  end
  
  private

  def run
    invalid_pins
    invalid_total if (@current_bowl == 2 && @current_frame < 10)
  end

  def invalid_pins
    raise('Your score must be between 0 and 10') if
      @pins.negative? || (@pins > 10)
  end

  def invalid_total
    raise('Your total score for the frame cannot exceed 10; please check your scores') if
      (@open_frame.pins_total + @pins) > 10
  end
end