require 'frame'

describe Frame do
  describe '#score' do
    it 'returns the total score of the frame' do
      expect(subject.score).to eq(0)
    end
  end
end