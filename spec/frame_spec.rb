require 'frame'

describe Frame do
  before(:each) { Frame.class_variable_set :@@log, [] }

  describe '.fallen_pins' do
    it 'creates a new frame on the first fallen pins' do
      expect(Frame).to receive(:new).with 1
      Frame.fallen_pins(1)
    end

    it 'adds to the first frame with the second fallen pins' do
      Frame.fallen_pins(1)
      expect(Frame).to_not receive(:new).with 1
      Frame.fallen_pins(1)
    end

    it 'creates a new frame on the third fallen pins' do
      Frame.fallen_pins(1)
      Frame.fallen_pins(1)
      expect(Frame).to receive(:new).with 1
      Frame.fallen_pins(1)
    end
  end
end
