require 'bowling_scorecard.rb'

describe BowlingScorecard do
  describe '.add_knocked_pins' do
    it 'registers number of pins knocked in a roll' do
      expect(subject).to receive(:add_knocked_pins).with(2)
      subject.add_knocked_pins(2)
    end

    it 'does not accept more than 10 pins knocked' do
      expect { subject.add_knocked_pins(12) }.to raise_error "This is a 10 pin bowling game!"
    end

    it 'adds input to total score' do
      subject.add_knocked_pins(2)
      subject.add_knocked_pins(5)
      expect(subject.total_score).to eq 7
    end

    it 'does not accept more than 10 pins in the same frame' do
      subject.add_knocked_pins(6)
      expect { subject.add_knocked_pins(6) }.to raise_error "This is a 10 pin bowling game!"
    end

    it 'ends frame after two consecutive rolls' do
      subject.add_knocked_pins(6)
      subject.add_knocked_pins(3)
      expect(subject.rolls).to eq []
    end

    it 'ends frame if first roll is a strike' do
      subject.add_knocked_pins(10)
      expect(subject.rolls).to eq []
    end
    
  end

  describe '.total_score' do
    it 'shows the total score from knocked pins input' do
      subject.add_knocked_pins(5)
      expect(subject.total_score).to eq 5
    end
  end
end
