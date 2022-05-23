require 'game'

describe Game do
  let(:game) { described_class.new }

  it 'user can start a new game' do
    expect(game).to be_instance_of Game
  end

  it 'can score a gutter game' do
    20.times { game.bowl(0) }

    expect(game.score).to eq 0
  end

  it 'can enter a full game of 4s' do
    20.times { game.bowl(4) }
    expect(game.score).to eq 80
  end

  it 'can enter a spare frame, followed by a frame of 2' do
    2.times { game.bowl(5) }
    game.bowl(2)
    game.bowl(0)
    expect(game.score).to eq 14
  end

  it 'can score a strike' do
    game.bowl(10)
    2.times { game.bowl(3) }
    expect(game.score).to eq 22
  end
end
