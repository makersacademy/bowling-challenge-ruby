require 'scorecard'

describe Scorecard do
  describe '#frame' do
    it 'starts on frame 1' do
      expect(subject.frame).to eq 1
    end
    it 'goes up after 2 rolls' do
      subject.roll
      subject.roll
      expect(subject.frame).to eq 2
    end
  end
end