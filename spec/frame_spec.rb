require 'frame'

describe Frame do
  let(:frame) { Frame.new }

  describe '#add_rolls' do
    it 'adds a frame' do
      frame.add_rolls(1,4)
      expect(frame.frames).to include([1,4])
    end
  end
end