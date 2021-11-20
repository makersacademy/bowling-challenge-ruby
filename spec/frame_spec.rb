require 'frame'

describe Frame do
  describe 'a new frame has ten pins' do
    it 'a new frame has a total a total of ten pins as a constant' do
      expect(subject.number_of_pins).to eq Frame::NO_OF_PINS
    end
  end
end
