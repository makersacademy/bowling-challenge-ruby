class Game

  def initialize
    @frames = []
    @strike = false
  end

  def add_frame(frame)
    @frames << frame
  end

  def total_score
    new_array = []

    @frames.each do |frame|
    
      if @strike == true
        new_array << frame.scores + frame.scores
        @strike = false
      else
        new_array << frame.scores
      end

      if frame.strike?
        @strike = true
      end

    end

    new_array.flatten.sum
  end

  private

  def strike_check

  end
end