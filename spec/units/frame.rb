require 'frame'

describe Frame do
  describe '#initialize' do
    it 'starts with a score of 0' do
      expect(subject.frame_score).to eq 0
    end
  end
end