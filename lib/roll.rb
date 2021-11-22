class Roll

  @@rolls = []

  def roll
    puts "please roll"
    current_role = gets.chomp
    if current_role.to_i > 10
      puts "there are only 10 pins, try again"
      roll
    end
    current_role
  end

  def self.rolls
    @@rolls
  end

end