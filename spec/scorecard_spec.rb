require 'scorecard'

describe Scorecard do
  describe 'initialize' do
    it 'starts on frame 1' do
      expect(subject.frame).to eq 1
    end
    it 'increases frame by 1 after two rolls' do
      subject.roll(1)
      subject.roll(1)
      expect(subject.frame).to eq 2
    end
    it 'keeps track of the score' do
      subject.roll(5)
      expect(subject.score).to eq 5
    end
  end
end