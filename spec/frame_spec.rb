require 'frame'

describe Frame do 
  describe 'score' do
    it 'starts at zero' do
      expect(subject.score).to be_zero
    end
  end

  describe 'add_roll' do
    it 'adds roll score to score' do
      subject.add_roll(1)
      expect(subject.score).to be 1
    end
  end
end