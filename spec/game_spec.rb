require './game'

describe Game do
  let(:game) { Game.new }

  # perfect game
  it 'can roll all strikes' do
    12.times { game.roll(10) }
    expect(game.scorecard).to eq 300
  end

  # guttter game
  it 'can roll all 0s ' do
    20.times { game.roll(0) }
    expect(game.scorecard).to eq 0
  end

  # spares game
  it 'can roll all spares ' do
    21.times { game.roll(5) }
    expect(game.scorecard).to eq 150
  end

  # rolling a strike
  it 'can roll a strike ' do
    game.roll(10)
    game.roll(1)
    game.roll(1)
    16.times { game.roll(0) }
    expect(game.scorecard).to eq 14
  end

  # rolling a spare
  it 'can roll a spare ' do
    game.roll(5)
    game.roll(5)
    game.roll(2)
    17.times { game.roll(0) }
    expect(game.scorecard).to eq 14
  end

  # normal game
  it ' can roll a normal game' do
    game.roll(3)
    game.roll(5)
    18.times { game.roll(0) }
    expect(game.scorecard).to eq 8
  end
end
