require 'bowling_scores'

describe BowlingScores do 

  describe '#record' do
    it 'allows user to input their scores' do
      score_card = BowlingScores.new()
      expect(score_card.record([3,4])).to include [3,4]
    end

    it 'prevents users from entering too many arguments' do 
      score_card = BowlingScores.new()
      expect { score_card.record([3,4], [3,4], [3,4], [3,4], [3,4], [3,4], [3,4], [3,4], [3,4], [3,4], [3,4], [3,4], [3,4]) }.to raise_error("Too many arguments")
    end

  end

    describe '#calculate_score' do
    it 'allows users to see their total score' do
      score_card = BowlingScores.new()
      score_card.record([1,5], [10,0], [10,0], [10,0], [3,7], [5,5], [3,4], [4,1], [0,0], [9,1], [9,0])
      expect(score_card.calculate_score()).to eq 138
    end

    it 'returns perfect score, when user inputs 12 strikes' do
      score_card = BowlingScores.new()
      score_card.record([10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0])
      expect(score_card.calculate_score()).to eq 300
    end

    it 'returns gutter game, when user misses all of the pins' do
      score_card = BowlingScores.new()
      score_card.record([0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0])
      expect(score_card.calculate_score()).to eq 0
    end

  end


end
