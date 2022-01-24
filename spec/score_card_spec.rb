require 'scorecard'

describe ScoreCard do
  let(:frame) { double 'Frame', fallen_pins: nil }
  let(:scorecard) { described_class.new(frame: frame) }

  describe '#enter_pins' do
    it 'returns Invalid Entry if first pin entry is > 10' do
      expect(scorecard.enter_pins(11)).to eq 'Invalid Entry'
    end
  end

  it 'passes the number of fallen pins to the frame' do
    expect(frame).to receive(:fallen_pins).with 3
    scorecard.enter_pins(3)
  end
end
