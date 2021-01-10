require_relative '../lib/bowling_scorecard.rb'

describe Scorecard do

  describe '#input_roll' do
    it 'adds the first roll result to the pins_knocked array' do
      expect(subject).to receive(:gets).and_return('1')
      subject.input_roll
      expect(subject.pins_knocked.first).to eq [1]
    end
  end

end
