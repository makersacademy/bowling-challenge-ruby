require 'game'

describe 'Add score' do
  it 'User can add the score of a single roll and see it displayed' do
    game = Game.new
    game.record_roll(5)
    expect(game.running_score).to eq(5)
  end
end
