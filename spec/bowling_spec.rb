require 'bowling_game'

describe BowlingGame do
  let(:game) { BowlingGame.new }

  it 'can roll a gutter game' do
    20.times { game.roll 0 }
    expect(game.score).to eq 0
  end

  it 'can roll all ones' do
    20.times { game.roll 1 }
    expect(game.score).to eq 20
  end
end
