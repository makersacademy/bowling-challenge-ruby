require 'bowling_challenge'

RSpec.describe BowlingChallenge do
    it "can roll gutter game" do
    game = BowlingChallenge.new
    20.times{game.roll 0}
    expect(game.score).to eq(0)

end
end