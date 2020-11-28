# frozen_string_literal: true

describe 'A game of bowling' do
  let(:game) { Game.new }

  it 'returns a gutter game' do
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can have a game where every roll is a 1' do
    20.times { game.roll(1) }
    expect(game.score).to eq 20
  end
end
