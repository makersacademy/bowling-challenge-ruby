require 'validity'

describe Validity do

  describe '#valid?' do
  
    it 'returns false if number outside min/max range' do
      expect(subject.valid?(20, 1, 10)).to be false
      expect(subject.valid?(-10, 1, 10)).to be false
    end

    it 'returns true if number inside min/max range' do
      expect(subject.valid?(10, 1, 10)).to be true
      expect(subject.valid?(1, 1, 10)).to be true
    end

    it 'returns false if not an integer' do
      expect(subject.valid?("a", 1, 10)).to be false
      expect(subject.valid?([], 1, 10)).to be false
    end

  end

end

# require 'roll'

# describe Roll do

#   let(:check) { double :check }

#   describe '#roll' do

#     it 'takes a parameter & stores it as instance variable' do
#       expect(subject.roll(3)).to eq 3
#     end

#     it 'checks for valid input' do
#       expect(check).to receive(:valid?).and_return(true, true)
#       subject.roll(1, Roll::ROLL_MAX, check)
#     end

#     it 'raises error for an invalid input' do
#       allow(check).to receive(:valid?).and_return(true, false)
#       message = 'Not a valid roll'
#       expect { subject.roll(-1, Roll::ROLL_MAX, check) }.to raise_error message
#     end

#     it 'raises error if roll higher than remaining pins' do
#       allow(check).to receive(:valid?).and_return(true, false)
#       message = 'Not a valid roll'
#       expect { subject.roll(8, 9, check) }.to raise_error message
#     end

#     it 'raises error if remaining pins outside allowed range' do
#       minimum = Roll::MIN_REMAIN_PINS
#       allow(check).to receive(:valid?) { false }
#       message = "Remaining pins must be between #{minimum}-#{Roll::ROLL_MAX}"
#       expect { subject.roll(minimum, minimum - 1) }.to raise_error message
#     end

#   end
  
# end
