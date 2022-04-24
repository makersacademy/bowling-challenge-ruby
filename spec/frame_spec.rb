require_relative '../lib/frame'

describe Frame do

  let(:frame) { Frame.new }

  context '#knocked_down_pins' do
    it 'logs the number of pins knowed down' do
      subject.knocked_down_pins(5)
      subject.knocked_down_pins(5)
      expect(subject).to have_attributes(:knocked_down_pins_log => [5, 5])
    end
  end

  context '#reset_knocked_down_pins_log' do
    it 'resets the log of knocked down pins' do
      frame.reset_knocked_down_pins_log
      expect(frame).to have_attributes(:knocked_down_pins_log => [])
    end
  end

  context '#spare?' do
    it 'returns true if user achieved a spare' do
      frame.knocked_down_pins(6)
      frame.knocked_down_pins(4)
      expect(frame.spare?).to be_truthy
    end

    it 'returns false if user did not achieve a spare' do
      frame.knocked_down_pins(6)
      frame.knocked_down_pins(3)
      expect(frame.spare?).to be_falsey
    end
  end

  context '#strike?' do
    it 'returns true if user acheived a strike' do
      frame.knocked_down_pins(10)
      expect(frame.strike?).to be_truthy
    end

    it 'returns false if user did not acheive a strike' do
      frame.knocked_down_pins(5)
      frame.knocked_down_pins(5)
      expect(frame.strike?).to be_falsey
    end
  end
end
