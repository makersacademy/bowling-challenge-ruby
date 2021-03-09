require 'frame'

describe Frame do
  let(:frame) { Frame.new(3,6) }
  let(:spare_frame) { Frame.new(6,4) }
  let(:strike_frame) { Frame.new(10) }

  describe 'roll1' do
    it 'returns roll1 value' do
      expect(frame.roll1).to eq 3
    end
  end

  describe 'roll2' do
    it 'returns roll2 value' do
      expect(frame.roll2).to eq 6
    end
  end

  describe 'strike?' do
    it 'returns true if roll1 = 0' do
      expect(strike_frame.strike?).to be true
    end

    it "returns false if roll1 is not 0" do
      expect(spare_frame.strike?).to be false
      expect(frame.strike?).to be false
    end
  end

  describe 'spare?' do
    it 'returns true if frame totals 10' do
      expect(spare_frame.spare?).to be true
    end

    it "returns false if not spare" do
      expect(strike_frame.spare?).to be false
      expect(frame.spare?).to be false
    end
  end

  describe 'get_roll' do
    it 'asks user for input' do
      expect{ subject.get_roll }.to output.to_stdout
    end
  end

end
