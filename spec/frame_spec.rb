require 'frame'

RSpec.describe Frame do

  let(:frame) { Frame.new }

  describe '#strike?' do
    it 'returns true if there is strike' do
      frame.first_roll = 10
      expect(frame.strike?).to eq true
    end

    it 'returns false if there is no strike' do
      frame.first_roll = 5
      expect(frame.strike?).to eq false
    end

    it 'returns false if called before first roll' do
      expect(frame.strike?).to eq false
    end
  end

  describe '#spare?' do
    it 'returns true if there is spare' do
      frame.first_roll = 6
      frame.second_roll = 4
      expect(frame.spare?).to eq true
    end

    it 'returns false if there is no spare' do
      frame.first_roll = 6
      frame.second_roll = 3
      expect(frame.spare?).to eq false
    end

    it 'returns false if there is strike' do
      frame.first_roll = 10
      expect(frame.spare?).to eq false
    end

    it 'returns false if called before second roll' do
      frame.first_roll = 3
      expect(frame.spare?).to eq false
    end  
  end
end