class Validity

  def valid?(number, min, max)
    return false unless number.is_a? Integer

    number >= min && number <= max
  end

end

      # def valid_frame_number_check(frame_id, check) # prob get rid of this as we use indexes in game class
      #   raise ERROR unless check.valid?(frame_id, FIRST_FRAME, LAST_FRAME)
      # end

       # def pins_remaining # do i need this here or move?
  #   !roll_1.nil? && roll_1 != :X && roll_2.nil? ? TOTAL_PINS - roll_1 : TOTAL_PINS
  # end

#   ROLL_MIN = 0
#   MIN_REMAIN_PINS = 1
#   ROLL_MAX = 10

#   def roll(pins, remaining_pins = ROLL_MAX, check = Validity.new)
#     remaining_pin_check(remaining_pins, check)
#     valid_roll_check(pins, remaining_pins, check)
#     pins
#   end
  
# private

#   def remaining_pin_check(remaining_pins, check)
#     message = "Remaining pins must be between #{MIN_REMAIN_PINS}-#{ROLL_MAX}"
#     raise message unless check.valid?(remaining_pins, MIN_REMAIN_PINS, ROLL_MAX) 
#   end

#   def valid_roll_check(pins, remaining_pins, check)
#     message = 'Not a valid roll'
#     raise message unless check.valid?(pins, ROLL_MIN, remaining_pins)
#   end
