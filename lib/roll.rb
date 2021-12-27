class Roll

  @@rolls = []

  def roll
    @current_roll = gets.chomp
    valid_roll?
    @current_roll
  end

  def valid_roll?
    if @current_roll.to_i > 10
      puts "\tThere are only 10 pins, try again."
      roll
    end
  end

  def self.rolls
    @@rolls
  end

end