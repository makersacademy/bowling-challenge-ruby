require 'frame'

RSpec.describe Frame do
  context 'initially' do
    it 'constructs a frame' do
      frame = Frame.new([0, 0])
      expect(frame.total_score).to eq 0
    end

    it 'recognises a spare' do
      frame1 = Frame.new([5, 5])
      frame2 = Frame.new([5, 3])

      expect(frame.spare?).to eq true
      expect(frame.spare?).to eq false
    end
  end
end