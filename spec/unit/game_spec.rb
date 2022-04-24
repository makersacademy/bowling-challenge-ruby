require 'game'

describe Game do
  let(:game) { described_class.new }
  it 'can score a single frame of 0s' do
    2.times { game.bowl(0) }
    expect(game.score).to eq 0
  end

  it 'can score a single frame of 2s' do
    2.times { game.bowl(2) }
    expect(game.score).to eq 4
  end

  it 'can score a gutter game' do
    20.times { game.bowl(0) }
    expect(game.score).to eq 0
  end

  it 'can score a game of all 2s' do
    20.times { game.bowl(2) }
    expect(game.score).to eq 40
  end

  it 'can score a spare, followed by a 2' do
    2.times { game.bowl(5) }
    game.bowl(2)
    game.bowl(0)
    expect(game.score).to eq 14
  end
  
end