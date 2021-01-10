require_relative '../lib/bowling_scorecard.rb'

describe Scorecard do

  describe '#input_roll' do
    it 'adds the first roll result to the pins_knocked array' do
      expect(subject).to receive(:gets).and_return('1')
      subject.input_roll
      expect(subject.pins_knocked.first).to eq [1]
    end

    it 'adds the second roll result to the pins_knocked array' do
      expect(subject).to receive(:gets).and_return('1').twice
      subject.input_roll
      subject.input_roll
      expect(subject.pins_knocked.first).to eq [1, 1]
    end

    it 'adds new frame tuples to the pins_knocked array when previous frame complete' do
      expect(subject).to receive(:gets).and_return('1').exactly(3).times
      subject.input_roll
      subject.input_roll
      subject.input_roll
      expect(subject.pins_knocked[1]).to eq [1]
    end
  end

end
