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
    it 'will skip to next frame given a strike' do
      subject.roll(10)
      expect(subject.frame).to eq 2
    end
    it 'will double the score if person has got a strike in the previous go' do
      subject.roll(10)
      subject.roll(2)
      subject.roll(3)
      expect(subject.score).to eq 20
    end
    it 'will double the score of first roll if person has got a spare in the previous go' do
      subject.roll(7)
      subject.roll(3)
      subject.roll(2)
      subject.roll(3)
      expect(subject.score).to eq 17
    end
    it 'will double the score if you get one strike after another' do
      subject.roll(10)
      subject.roll(10)
      subject.roll(10)
      expect(subject.score).to eq 50
    end
  end

  describe '#print_scorecard' do
    it 'prints current scorecard' do
      subject.roll(3)
      subject.roll(7)
      expect { subject.print_scorecard }.to output("Frame 1 => Roll 1: 3, Roll 2: 7\nTotal score: 10\n").to_stdout
    end
    it 'deals with strikes and being in the middle of a frame by not printing a score' do
      subject.roll(3)
      subject.roll(4)
      subject.roll(10)
      subject.roll(4)
      expect { subject.print_scorecard }.to output("Frame 1 => Roll 1: 3, Roll 2: 4\nFrame 2 => Roll 1: 10, Roll 2: \nFrame 3 => Roll 1: 4, Roll 2: \nTotal score: 21\n").to_stdout
    end
  end
end
