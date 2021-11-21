require 'bowling'

describe Bowling do
  describe '#roll' do
    it 'takes an argument of the amount of pins hit by the player and adds it to the frames array' do
      subject.roll(3)
      subject.roll(5)
      subject.roll(6)
      subject.roll(2)
      expect(subject.frames).to eq [[3, 5], [6, 2]]
    end
  end

  describe '#set_frame' do
    it 'sets the current frame number (1 or 2) depending on rolls' do
      subject.roll(3)
      expect(subject.set_frame).to eq 2
    end
  end

  describe '#is_strike?' do
    it 'takes an argument of amounts of pins hit and decides whether the hit was a strike or not' do
      expect(subject.is_strike?(10)).to eq true
    end
  end
  
  describe '#calculate_score' do
    it 'calculates the score based upon the array of frames' do
      subject.roll(10)
      18.times do subject.roll(1) end
      expect(subject.calculate_score).to eq 30
    end
  end
end