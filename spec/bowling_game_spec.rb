require 'rspec'
require_relative '../lib/bowling_game.rb'

describe 'Bowling game behaviour' do

  it 'can roll a gutter game' do
    game = BowlingGame.new
    20.times{game.roll 0}
    expect(game.score).to eq 0
  end
end