
require 'frame'

describe Frame do
  describe '#complete' do
    it 'is complete with a strike' do
      subject.roll = 10
      expect(subject.complete?).to eq true
    end
    it 'is complete with a spare' do
      subject.roll = 5
      subject.roll = 5
      expect(subject.complete?).to eq true
    end
    it 'is not complete if no spare or strike' do
      subject.roll = 5
      subject.roll = 2
      expect(subject.complete?).to eq false
    end
  end

  describe '#outstanding_bonus' do
    it 'is true when bonus' do
      subject.roll = 10
      expect(outstanding_bonus?).to eq true
    end
    it 'is false when no bonus' do
      subject.roll = 5
      subject.roll = 2
      expect(outstanding_bonus?).to eq false
    end
  end

  describe '#roll' do
    it 'applies the correct score' do
      subject.roll = 5
      
    end
  end

  describe '.all' do
  end

  describe '.final_frame' do
  end

  describe '.final_frame_bonus?' do
  end

  describe '.apply_outstanding_bonuses' do
  end


end