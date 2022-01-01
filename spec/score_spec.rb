require 'score'

describe Score do
  describe '#total' do
    it 'returns the total score' do
      expect(subject.total).to eq(0)
    end
  end
end