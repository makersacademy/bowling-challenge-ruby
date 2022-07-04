require 'game'

RSpec.describe Game do
  it "initializes with an empty scorecard" do
    game = Game.new
    expect(game.score_card).to eq []
  end

end
