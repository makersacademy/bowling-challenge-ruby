class Player 
  # needs to keep track of their own frames 

attr_reader :name, :frames, :current_score

  def initialize(name, frames = Array.new, current_score = 0)
    @name = name
    @frames = frames
    @current_score = current_score
  end

  def frame
    fail "Game is complete no frames remaining" if @frames.length == 10
    first_bowl = rand(0..10)
    # case strike
    return @frames << ["X", "-"] if first_bowl == 10
    remaining_pins = 10 - first_bowl
    second_bowl = rand(0..remaining_pins)
    # case spare
    return @frames << [first_bowl, "/"] if (first_bowl + second_bowl) == 10 
    # case no spare or strike scored
    @frames << [first_bowl, second_bowl]
  end

  def total
    spare = false
    tally = [] 
    iteration = 0
    @frames.each do |frame| 
      tally[iteration - 1] += frame[0] if spare
      if frame[1] == '/'
        tally << 10
        spare = true
      else 
        tally << frame.sum 
        spare = false
      end 
    iteration += 1
    end 
  tally.sum
  end

end