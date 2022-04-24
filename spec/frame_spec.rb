require_relative '../lib/frame'

describe Frame do
  context '#knocked_down_pins' do
    it 'logs the number of pins knowed down' do
      subject.knocked_down_pins(5)
      subject.knocked_down_pins(5)
      expect(subject).to have_attributes(:knocked_down_pins_log => [5, 5])
    end
  end

  context '#reset_knocked_down_pins_log' do
    it 'resets the log of knocked down pins' do
      frame = Frame.new
      frame.reset_knocked_down_pins_log
      expect(frame).to have_attributes(:knocked_down_pins_log => [])
    end
  end
end