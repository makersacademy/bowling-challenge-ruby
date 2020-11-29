# frozen_string_literal: true

describe 'A game of bowling' do
  let(:game) { Game.new }
  let(:rolls) { 17.times { game.roll(0) } }

  it 'returns a gutter game' do
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can have a game where every roll is a 2' do
    20.times { game.roll(2) }
    expect(game.score).to eq 40
  end

  it 'can calculate a spare' do
    game.roll(5)
    game.roll(5)
    game.roll(2)
    rolls
    expect(game.score).to eq 14
  end

  it 'can calculate a strike' do
    game.roll(10)
    game.roll(3)
    game.roll(4)
    rolls
    expect(game.score).to eq 24
  end

  it 'correctly checks multiple strikes' do
    game.roll(10)
    game.roll(10)
    game.roll(3)
    rolls
    expect(game.score).to eq 39
  end

  it 'stops a player throwing too many rolls' do
    rolls
    game.roll(3)
    game.roll(3)
    game.roll(3)
    expect(game.score).to eq 9
    expect { game.roll(3) }.to raise_error('Your game is now complete')
  end

  it 'stops edge case of trying to roll 13 strikes' do
    15.times { game.roll(10) }
    expect(game.score).to eq 300
  end

  # it 'stops knocking down more than ten pins per frame' do
  #   game.roll(7)
  #   expect { game.roll(6) }.to raise_error("You can't knock down more than ten pins in a frame")
  # end

  it 'gives a bonus frame if strike or spare in 10th frame' do
    rolls
    game.roll(0)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    expect(game.score).to eq 30
  end

  it 'stops after the bonus rolls' do
    rolls
    game.roll(0)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    expect { game.roll(10) }.to raise_error('Your game is now complete')
    expect(game.score).to eq 30
  end

  it 'stops bonus frame if game doesnt end with spare or strike' do
    9.times { game.roll(10) }
    game.roll(5)
    game.roll(4)
    expect(game.score).to eq 263
    expect { game.roll(8) }.to raise_error('Your game is now complete')
  end
end
