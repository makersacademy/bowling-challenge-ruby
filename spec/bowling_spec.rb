require 'bowling'

describe Bowling do
  describe '#roll' do
    it 'takes an argument of the amount of pins hit by the player and adds it the frames array' do
      subject.roll(3)
      expect(subject.frames.length).to eq 1
    end
  end
end