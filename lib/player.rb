class Player 
  # needs to keep track of their own frames 

attr_reader :name, :frames, :current_score, :strike_streak

  def initialize(name, frames = Array.new, current_score = 0)
    @name = name
    @frames = frames
    @current_score = current_score
    @strike_streak = 0
  end

  def frame
    fail "Game is complete no frames remaining" if @frames.length == 10
    first_bowl = rand(0..10)
    # case strike
    return @frames << [10, 0] if first_bowl == 10
    remaining_pins = 10 - first_bowl
    second_bowl = rand(0..remaining_pins)
    # case spare 
    # case no spare or strike scored
    @frames << [first_bowl, second_bowl]
  end

  def total
    spare = false
    strike = false
    tally = 0
    @frames.each do |frame| 
      tally += frame.sum if strike
      tally += frame[0] if spare
      if frame[0] == 10
        tally += 10
        strike = true
        spare = false
      elsif frame.sum == 10
        tally += 10
        spare = true
        strike = false
      else 
        tally += frame.sum 
        spare = false
        strike = false
      end
    p tally
    end 
  tally
  end

end