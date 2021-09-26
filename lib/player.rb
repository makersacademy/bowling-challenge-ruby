class Player

  def self.enter_roll(pins:, frame:, roll:)
    print "#{roll} score:"
    input = handle_input(pins)
    input > pins ? pins : input
  end

  def self.handle_input(pins)
    while true do
    input = gets.to_i
    (0..pins).include?(input) ? (return input) : (puts "Please enter a valid score from 0 to #{pins}")
    end
  end

  private_class_method :handle_input

end