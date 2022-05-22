require 'scorecard'

describe Scorecard do
  it "can roll a gutter game" do
    game = Scorecard.new

    20.times {game.roll_ball(0)}
    expect(game.total_score).to eq 0
  end

end
