require 'scorecard'

describe Scorecard do
  describe '#initialize' do
    it 'starts with frame 1' do
      expect(subject.frame).to eq 1
    end
    it 'starts with an empty scorecard' do
      expect(subject.scorecard).to be_empty
    end
    it 'starts with 0 as the score' do
      expect(subject.score).to eq 0
    end
  end

  describe '#roll' do
    it 'increases the score with the roll' do
      subject.roll(5)
      subject.roll(4)
      expect(subject.score).to eq 9
    end
    it 'increases the frame' do
      subject.roll(3)
      subject.roll(4)
      expect(subject.frame).to eq 2
    end
    it 'raises an error if score above 10 is entered' do
      expect { subject.roll(11) }.to raise_error 'This score is invalid'
    end
    it 'adds to the scorecard' do
      subject.roll(3)
      subject.roll(7)
      expect(subject.scorecard).to eq({ 1 => [3, 7] })
    end
    it 'raises error if second roll adds up to more than 10' do
      subject.roll(8)
      expect { subject.roll(4) }.to raise_error 'This score is invalid'
    end
  end

  describe '#print_scorecard' do
    it 'prints current scorecard' do
      subject.roll(3)
      subject.roll(7)
      expect { subject.print_scorecard }.to output("Frame 1 => Roll 1: 3, Roll 2: 7\nTotal score: 10\n").to_stdout
    end
  end
end
