require 'game'

describe Game do 
  let(:game) { Game.new }
  # gutter game
  # all ones
  # input scores are valid
  # spare
  # strike
  it 'rolls a gutter game' do
    20.times { game.roll(0) }
    expect(game.score).to eq(0)
  end
  # it 'rolls a game of all ones' do
  #   20.times { game.roll(1) }
  #   expect(game.score).to eq(20)
  # end
end