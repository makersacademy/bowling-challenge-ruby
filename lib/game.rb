class Game 
  attr_reader :total_score, :current_frame

  def initialize
    @total_score = 0
    @current_frame = 1
  end
end