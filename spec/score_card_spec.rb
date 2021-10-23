require 'score_card'

describe ScoreCard do 
  describe 'initialisation' do 
    it 'will return an instance of the ScoreCard class' do
      scorecard = ScoreCard.new
      expect(scorecard).to be_a ScoreCard
    end 
  end
end 