require 'roll'

describe Roll do

  describe '#roll' do

    it 'takes a parameter & stores it as instance variable' do
      expect(subject.roll(3)).to eq 3
    end

    it 'does not accept values below 0 or above 10' do
      message = 'Not a valid roll'
      expect { subject.roll(-1) }.to raise_error message
      expect { subject.roll(11) }.to raise_error message
    end

    it 'does not accept non-integer values' do
      message = 'Not a valid roll'
      expect { subject.roll('a') }.to raise_error message
    end

  end
  
end
