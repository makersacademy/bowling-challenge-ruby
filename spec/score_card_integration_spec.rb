require 'frame'
require 'score_card'

RSpec.describe 'integration' do
  it 'returns game score of 0 for a Gutter Game' do
    score_card = ScoreCard.new
    
    expect(score_card.game_score).to eq(0)
  end

  xit 'returns game score of 300 for a Perfect Game' do
    
  end
end