require 'scorecard'

describe ScoreCard do
  it 'returns a score of 2 after entering one pin twice' do
    subject.enter_pins(1)
    expect(subject.enter_pins(1)).to eq 2
  end
end