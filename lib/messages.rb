# frozen_string_literal: true

module Messages
  def message1
    'Enter your score for roll 1'
  end

  def message2
    'Enter your score for roll 2'
  end

  def strike_message
    'Woohoo, strike!!!'
  end

  def spare_message
    'Spare! Good one!'
  end

  def frame_message
    "Frame #{frame_number}"
  end

  def bonus_roll_message
    'Enter your score for your bonus roll'
  end

  def pins_error
    'There aren\'t that many pins!'
  end
end
