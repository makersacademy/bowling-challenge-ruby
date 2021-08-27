class Game 
  attr_reader :total_score, :frames

  def initialize
    @total_score = 0
    @frames = [Frame.new]
  end
end