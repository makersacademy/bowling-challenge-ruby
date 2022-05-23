require 'scorecard'

describe Scorecard do
  it "can roll a gutter game" do
    game = Scorecard.new

    20.times { game.roll_ball(0) }
    expect(game.total_score).to eq 0
  end

  it "can roll all ones" do
    game = Scorecard.new

    20.times { game.roll_ball(1) }
    expect(game.total_score). to eq 20
  end

  it "can roll a spare" do
    game = Scorecard.new

    game.roll_ball(5)
    game.roll_ball(5)
    game.roll_ball(3)
    17.times { game.roll_ball(0) }
    expect(game.total_score).to eq 16
  end

  it "can roll a strike" do
    game = Scorecard.new

    game.roll_ball(10)
    game.roll_ball(5)
    game.roll_ball(2)
    16.times { game.roll_ball(0) }
    expect(game.total_score).to eq 24
  end

  it "can roll the perfect game" do
    game = Scorecard.new

    12.times { game.roll_ball(10) }
    expect(game.total_score).to eq 300
  end

  it "can roll all spares" do
    game = Scorecard.new

    game.roll_ball(9)
    game.roll_ball(1)
    game.roll_ball(9)
    game.roll_ball(1)
    game.roll_ball(9)
    game.roll_ball(1)
    game.roll_ball(9)
    game.roll_ball(1)
    game.roll_ball(9)
    game.roll_ball(1)
    game.roll_ball(9)
    game.roll_ball(1)
    game.roll_ball(9)
    game.roll_ball(1)
    game.roll_ball(9)
    game.roll_ball(1)
    game.roll_ball(9)
    game.roll_ball(1)
    game.roll_ball(9)
    game.roll_ball(1)
    game.roll_ball(9)
    expect(game.total_score).to eq 190
  end
end
