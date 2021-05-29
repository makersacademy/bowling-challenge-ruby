# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  it 'begins the game with a score of 0' do
    expect(subject.total_score).to eq 0
  end

  it 'begins the game at Frame 1: Roll 1' do
    expect(subject.current_frame).to eq 1
    expect(subject.current_roll).to eq 1
  end

  describe '#roll_1' do
    it 'fails when too many pins entered' do
      expect { subject.roll_1(11) }.to raise_error 'Max pins exceeded, recheck and try again'
    end

    it 'increases the total score' do
      subject.roll_1(5)
      expect(subject.total_score).to eq 5
    end

    it 'prompts roll_2 if fewer than 10 pins knocked down' do
      subject.roll_1(5)
      expect(subject.current_roll).to eq 2
    end

    it 'ends the frame if roll 1 = strike' do
      subject.roll_1(10)
      expect(subject.current_frame).to eq 2
    end
  end

  describe '#roll_2' do
    it 'fails when too many pins entered' do
      subject.roll_1(5)
      expect { subject.roll_2(6) }.to raise_error 'Max pins exceeded, recheck and try again'
    end

    it 'increases the total score' do
      subject.roll_1(2)
      subject.roll_2(5)
      expect(subject.total_score).to eq 7
    end

    it 'advances to first roll of next frame' do
      subject.roll_1(2)
      subject.roll_2(5)
      expect(subject.current_frame).to eq 2
      expect(subject.current_roll).to eq 1
    end
  end
end
