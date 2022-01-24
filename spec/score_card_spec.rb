require 'scorecard'

describe ScoreCard do
  let(:scorecard) { described_class.new }

  describe '#enter_pins' do
    it 'returns a score of 1 after entering one pin' do
      expect(scorecard.enter_pins(1)).to eq 1
    end

    it 'returns a score of 2 after entering one pin twice' do
      scorecard.enter_pins(1)
      expect(scorecard.enter_pins(1)).to eq 2
    end

    it 'returns Invalid Entry if first pin entry is > 10' do
      expect(scorecard.enter_pins(11)).to eq 'Invalid Entry'
    end
  end
end
