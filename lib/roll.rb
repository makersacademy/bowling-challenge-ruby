class Roll

  @@rolls = []

  def roll
    puts "please roll"
    current_role = gets.chomp.to_i
    puts("there are only 10 pins, try again") if roll > 10
    roll > 10 ? roll : current_role
  end

  def self.rolls
    @@rolls
  end

end