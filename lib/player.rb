class Player 
  # needs to keep track of their own score 
  # needs to track any streaks of strikes in their score ????

attr_reader :name, :score

  def initialize(name, score = Array.new)
    @name = name
    @score = score
  end

  def frame
    fail "Game is complete no frames remaining" if @score.length == 10
    current_frame = Array.new
    first_bowl = rand(0..10)
    if first_bowl == 10 
      current_frame << "X"
      current_frame << "-"
      @score << current_frame
      return
    else
    end  
    current_frame << first_bowl
    remaining_pins = 10 - first_bowl
    second_bowl = rand(0..remaining_pins)
    if (first_bowl + second_bowl) == 10 
      current_frame << "/"
      @score << current_frame
      return 
    else
    end
    current_frame << second_bowl
    @score << current_frame
  end

end