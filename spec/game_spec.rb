require 'game'

describe Game do
  describe '#score' do
    it 'returns the total score' do
      frame1 = double("frame1", :score => 1)
      frame2 = double("frame2", :score => 2)
      subject.frames << frame1
      subject.frames << frame2
      expect(subject.score).to eq(3)
    end
  end
end