class Player 
  # needs to keep track of their own score 
  # needs to track any streaks of strikes in their score 

attr_reader :name, :score

  def initialize(name, score = Array.new)
    @name = name
    @score = score
    # @frame = frame
  end

  def frame
    fail "Game is complete no frames remaining" if @score.length == 10
    current_frame = Array.new
    first_bowl = rand(0..10)
    current_frame << first_bowl
    second_bowl = 10 - first_bowl
    current_frame << rand(0..second_bowl) 
    p @score << current_frame
  end

end 