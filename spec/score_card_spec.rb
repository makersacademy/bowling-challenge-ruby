require 'score_card'

describe ScoreCard do

  describe '#check_scores' do
    it 'calls the Gutter Game method if score count is 0' do
      score_card = ScoreCard.new(0,0)
      expect(score_card.check_scores).to eq 'Gutter Game'
    end

    it 'calls perfect game method if strike count is 12' do
      score_card = ScoreCard.new(300,12)
      expect(score_card.check_scores).to eq 'Perfect Game'
    end
  end

  describe '#print_scores' do
    it 'prints Perfect Game with the scores' do
      score_card = ScoreCard.new(75,2)
      score_card.check_scores
      expect(score_card.print_scores).to include ' Your score was 75, with 2 strikes'
    end

    it 'prints Gutter Game with the scores' do
      score_card = ScoreCard.new(0,0)
      score_card.check_scores
      expect(score_card.print_scores).to include 'Gutter Game'
    end

    it 'prints Gutter Game with the scores' do
      score_card = ScoreCard.new(300,12)
      score_card.check_scores
      expect(score_card.print_scores).to include 'Perfect Game'
    end


  end

end