require 'bowling_game'

describe BowlingGame do
  let(:game) { described_class.new }
  it 'can score a single frame of 0s' do
    2.times { game.bowl(0) }
    expect(game.score).to eq 0
  end

  it 'can score a single frame of 2s' do
    2.times { game.bowl(2) }
    expect(game.score).to eq 4
  end
end