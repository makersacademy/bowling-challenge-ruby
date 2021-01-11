require 'game'

describe "1. In order order score a bowling Game" do
  it "I would like to create a Game" do
    expect(Game.create).to be_a Game
  end
end
