require 'score_card'

describe ScoreCard do 
  describe 'initialisation' do 
    it 'will return an instance of the ScoreCard class' do
      scorecard = ScoreCard.new([
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0]])
      expect(scorecard).to be_a ScoreCard
    end 
  end

  describe '.result' do 
    it 'will return for the Gutter Game' do 
      scorecard = ScoreCard.new([
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0]])
      expect(scorecard.result).to eq 0
    end
  end 
end 