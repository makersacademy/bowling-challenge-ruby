require 'frame'

RSpec.describe Frame do
  describe '#initialize' do
    it 'creates a new frame with an empty roll array' do
      frame = Frame.new
      expect(frame.rolls).to eq([])
    end
  end
end
