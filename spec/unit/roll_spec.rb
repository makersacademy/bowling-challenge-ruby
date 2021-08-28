require 'roll'

describe Roll do

  describe '#roll' do

    it 'takes a parameter & stores it as instance variable' do
      expect(subject.roll(3)).to eq 3
    end

    it 'checks for valid input' do
      check = double
      expect(check).to receive(:valid?) { true }
      subject.roll(1, check)
    end

    it 'raises error for an invalid input' do
      check = double
      allow(check).to receive(:valid?) { false }
      message = 'Not a valid roll'
      expect { subject.roll(-1, check) }.to raise_error message
    end

  end
  
end
