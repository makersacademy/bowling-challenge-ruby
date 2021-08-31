require 'frame'
require 'scorecard'

describe Scorecard do
  it 'creates an array of frames from an array of rolls' do
    card = Scorecard.new([1, 5, 10, 4, 6])

    expect(card.scores[0].class).to eq (Frame)
    expect(card.scores[1].class).to eq (Frame)
    expect(card.scores[2].class).to eq (Frame)
  end

  it 'selects the first ten frames' do
    card1 = Scorecard.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
    card2 = Scorecard.new(
      [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
       5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
    )

    expect(card1.first_ten_frames.length).to eq 10
    expect(card2.first_ten_frames.length).to eq 10
  end
end
