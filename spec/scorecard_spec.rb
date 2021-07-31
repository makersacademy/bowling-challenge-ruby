require 'scorecard'

describe Scorecard do
  describe '#initialize' do
    it 'starts with frame 1' do
      expect(subject.frame).to eq 1
    end
    it 'starts with an empty scorecard' do
      expect(subject.scorecard).to be_empty
    end
    it 'starts with 0 as the score' do
      expect(subject.score).to eq 0
    end
  end
end