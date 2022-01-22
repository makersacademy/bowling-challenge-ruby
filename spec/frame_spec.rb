require 'frame'

describe Frame do
  
  let(:strike_frame) { Frame.new(10) }
  let(:spare_frame) { Frame.new(0, 10) }
  let(:open_frame) { Frame.new(0, 0) }
  let(:open_frame_2) { Frame.new(7, 2)}

  describe '#bonus_throws?' do
    it 'returns 2' do
      expect(strike_frame.bonus_throws).to eq 2
    end

    it 'returns 1' do
      expect(spare_frame.bonus_throws).to eq 1
    end

    it 'returns 1' do
      frame = Frame.new(3, 7)
      expect(frame.bonus_throws).to eq 1
    end

    it 'returns 0' do
      expect(open_frame.bonus_throws).to eq 0
    end
    
    it 'returns 0' do
      expect(open_frame_2.bonus_throws).to eq 0
    end
  end
  
  describe '#add_points' do
    it 'adds 5 to score' do
      strike_frame.add_points(5)
      expect(strike_frame.score).to eq 15
    end
  end
end

