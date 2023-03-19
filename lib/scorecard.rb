class ScoreCard
  attr_accessor :score_card
  
  def initialize(io = Kernel)
    @io = io
    @score_card = _create_frames
  end

  def run

  end

  private

  def _create_frames
    return unless @score_card.nil?
    @score_card = []
    (0..9).each do |index| 
      @score_card[index] = {number: nil, status: nil, rolls: [], bonus: []}
    end
    return @score_card
  end
end
