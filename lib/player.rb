class Player
  attr_reader :roll
  def roll
    "What is your roll?"
    @roll = gets.chomp
  end
end
