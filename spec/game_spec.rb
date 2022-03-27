require 'game'

describe Game do
  subject(:game) { described_class.new }

  it 'initializes with an empty frames array' do
    expect(game.frames).to eq []
  end

  it 'adds a frame to the array every two rolls' do
    game.frame(4, 5)
    game.frame(3, 6)
    expect(game.frames).to eq [[4, 5], [3, 6]]
  end

end