require 'frame'

describe Frame do
  it 'should store an array of rolls' do
    expect(described_class.new(4, 5).rolls.length).to eq 2
  end
  describe '#is_strike?' do
    it 'should return true if first roll is a 10' do
      strike = described_class.new(10)
      expect(strike.is_strike?).to be true
    end
    it 'should not return true if second roll is a 10' do
      not_strike = described_class.new(0, 10)
      expect(not_strike.is_strike?).to be false
    end
    it 'should not return true if rolls combine to 10' do
      not_strike = described_class.new(5, 5)
      expect(not_strike.is_strike?).to be false
    end
  end
  describe '#is_spare?' do
    it 'should return true if rolls combine to 10' do
      not_strike = described_class.new(5, 5)
      expect(not_strike.is_spare?).to be true
    end
    it 'should return true if second roll is a 10' do
      not_strike = described_class.new(0, 10)
      expect(not_strike.is_spare?).to be true
    end
    it 'should not return true if frame is a strike' do
      strike = described_class.new(10)
      expect(strike.is_spare?).to be false
    end
  end
  describe '#base_score' do
    it 'gets score of frame before bonuses' do
      not_strike = described_class.new(3, 4)
      expect(not_strike.base_score).to eq 7
    end
  end

  describe '#add_bonus' do
    it 'adds bonus to final_score' do
      strike = described_class.new(10)
      expect { strike.add_bonus(7) }.to change { strike.final_score }.by 7
    end
  end


end
