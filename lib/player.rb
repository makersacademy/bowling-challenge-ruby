class Player
  attr_reader :score

  def roll
    "What is your roll?"
    @score = $stdin.gets.chomp.to_i
  end
end
