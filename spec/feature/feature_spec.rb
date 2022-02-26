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
  it "a player scores 5 gutter frames in a row" do
    game.roll(0)
    game.roll(0)
    game.roll(0)
    game.roll(0)
    game.roll(0)
    game.roll(0)
    game.roll(0)
    game.roll(0)
    game.roll(0)
    game.roll(0)
    expect(game.frames_total.sum).to eq 0
  end
  it "a player scores 5 4's and a 2 and a 10" do
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(2)
    game.roll(10)
    expect(game.frames_total.sum).to eq 32
  end
  it "a player scores 5 4's, a 2, a strike, a 5 and a 2" do
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(2)
    game.roll(10)
    game.roll(5)
    game.roll(2)
    expect(game.roll_counter).to eq 11
    expect(game.frames_total.sum).to eq 46
  end
end