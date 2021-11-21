require 'bowling'

describe Bowling do
  describe '#roll' do
    it 'takes an argument of the amount of pins hit by the player and adds it the frames array' do
      subject.roll(3)
      expect(subject.frames.length).to eq 1
    end
  end

  describe '#is_strike?' do
    it 'takes an argument of amounts of pins hit and decides whether the hit was a strike or not' do
      expect(subject.is_strike?(10)).to eq true
    end
  end

  describe '#is_spare?' do
    it 'takes an argument of amounts of pins hit added to previous bowl to decide whether the hit was a spare or not' do
      subject.roll(7)
      expect(subject.is_spare?(3)).to eq true
    end
  end
end