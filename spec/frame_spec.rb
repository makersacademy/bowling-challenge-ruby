require './lib/frame'

describe Frame do

  let(:frame) { described_class.new }

  describe '#roll' do
    it 'reduces the number of standing pins by pins knocked down' do
      frame.roll(6)
      expect(frame.pins_standing).to eq 4
    end

    it 'outputs the score from the roll' do
      expect(frame.roll(6)[:score]).to eq 6
    end

    it 'raises an error if attempt to knock down more pins than are standing' do
      frame.roll(5)
      expect { frame.roll(7) }.to raise_error("Cannot knock down more pins than are standing")
    end
  end

  describe '#cleared?' do 
    
    it 'returns true if there are no pins standing' do
      frame.roll(10)
      expect(frame.cleared?).to be true
    end

    it 'returns false if there are still pins standing' do
      frame.roll(5)
      expect(frame.cleared?).to be false
    end
  end

end