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

  it 'can roll a spare' do
    game.roll(5)
    game.roll(5)
    game.roll(7)
    17.times { game.roll(0) }
    expect(game.score).to eq 24
  end

  it 'can roll a strike' do
    game.roll(10)
    game.roll(5)
    game.roll(6)
    16.times { game.roll(0) }
    expect(game.score).to eq 32
  end

  it 'can roll a perfect game' do
    12.times { game.roll(10) }
    expect(game.score).to eq 300
  end

  it 'can roll all spares' do
    21.times { game.roll(5) }
    expect(game.score).to eq 150
  end
end