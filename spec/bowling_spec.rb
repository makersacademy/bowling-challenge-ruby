require 'bowling'

describe 'new BowlingGame' do
  it 'starts a new BowlingGame' do
    game = BowlingGame.new
  end
end

describe 'player bowls a perfect game' do
  it 'returns a perfect game score of 300' do
    perfect_game = 300
  end
end

describe 'player bowls a Gutter Game which is when no pins are knocked down' do
  it ' returns a gutter_game score of 0' do
    game = BowlingGame.new
    20.times{game.roll 0}
    expect(game.score).to eq 0
  end
end


describe 'player bowls a strike' do
  it 'returns a score of 10' do
    score = 10
  end
end
