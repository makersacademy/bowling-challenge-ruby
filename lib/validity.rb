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