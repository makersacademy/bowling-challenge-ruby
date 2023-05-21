require 'frame'

RSpec.describe Frame do
  context 'initially' do
    it 'constructs a frame' do
      frame = Frame.new([0, 0])
      expect(frame.rolls).to eq [0, 0]
      expect(frame.total_score).to eq 0
    end
  end
end