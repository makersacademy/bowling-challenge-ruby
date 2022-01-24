class Player 

  attr_reader :roll
  
  def roll
    puts "Enter pins to throw:"
    pins = STDIN.gets.chomp
    pins
  end

end
