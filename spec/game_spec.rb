require 'game'

describe Game do
  describe 'initialize' do
    it 'has a total score of 0' do
      expect(subject.total_score).to eq 0
    end
  end
end