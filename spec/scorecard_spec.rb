require 'frame'
require 'scorecard'

describe Scorecard do
  it 'creates an array of frames from an array of rolls' do
    card = Scorecard.new([1, 5, 10, 4, 6])

    expect(card.scores[0].class).to eq (Frame)
    expect(card.scores[1].class).to eq (Frame)
    expect(card.scores[2].class).to eq (Frame)
  end
end
