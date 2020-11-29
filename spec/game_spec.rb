# frozen_string_literal: true

describe 'A game of bowling' do
  let(:game) { Game.new }
  let(:rolls) { 17.times { game.roll(0) } }

  it 'returns a gutter game' do
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can have a game where every roll is a 1' do
    20.times { game.roll(1) }
    expect(game.score).to eq 20
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

  # it 'stops a player throwing too many rolls' do
  #   rolls
  #   game.roll(3)
  #   game.roll(3)
  #   game.roll(3)
  #   expect(game.score).to eq 9
  #   expect { game.roll(3) }.to raise_error('Your game is now complete')
  # end
end
