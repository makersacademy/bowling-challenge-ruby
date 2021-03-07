class Scores
  attr_reader :table
  
  def initialize(display:)
    @display = display
    @table = {}
    @total = 0
  end

  def update(frame_number:, score:)
    @total += score
    @table[:frame_number] = @total
    @display.update_score(frame_number: frame_number, score: @total)
  end
end