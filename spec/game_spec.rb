require 'game'

describe Game do
  subject(:game) { described_class.new }

  it 'can roll a gutter game' do
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can roll 1 every time' do
    20.times { game.roll(1) }
    expect(game.score).to eq 20
  end

  it 'can roll 2 every time' do
    20.times { game.roll(2) }
    expect(game.score).to eq 40
  end
end