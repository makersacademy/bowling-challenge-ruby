# frozen_string_literal: true

require 'frame'

describe Frame do
  describe '#score' do
    it 'returns the total score of the frame' do
      expect(subject.score).to eq(0)
    end
  end

  describe '#set_roll1' do
    it 'records the score for roll one' do
      subject.set_roll1(2)
      expect(subject.roll1).to eq(2)
    end
  end

  describe '#set_roll2' do
    it 'records the score for roll two' do
      subject.set_roll2(2)
      expect(subject.roll2).to eq(2)
    end
  end

  describe '#strike?' do
    it 'returns true if it is a strike' do
      subject.set_roll1(10)
      expect(subject.strike?).to be_truthy 
    end
  end
  
  describe '#spare?' do
    it 'returns true if it is a spare' do
      subject.set_roll1(4)
      subject.set_roll2(6)
      expect(subject.spare?).to be_truthy 
    end
  end
end
