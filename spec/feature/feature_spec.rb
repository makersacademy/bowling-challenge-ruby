require 'game'

describe "a bowling match" do
  let(:game) { Game.new }
  it "a player rolls 5 strikes in a row" do
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    expect(game.frames_total.sum).to eq 130
  end
end