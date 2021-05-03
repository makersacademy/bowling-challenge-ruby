require 'scorecard'

describe Scorecard do
  describe '#add_score' do
    it 'adds the score to the scorecard' do
      subject.add_score(5)

      expect(subject.scorecard.first[:total_score]).to eq 5
    end
  end
end
