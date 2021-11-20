require 'frame'

describe Frame do
  describe 'a new frame has ten pins' do
    it 'a new frame has a total a total of ten pins as a constant' do
      expect(subject.number_of_pins).to eq Frame::NO_OF_PINS
    end
  end
end

# As a player
# So I can complete a frame
# I want a frame to have 10 pins

# As a player
# So I can complete a frame
# I want to be able to knock down 10 pins in a roll