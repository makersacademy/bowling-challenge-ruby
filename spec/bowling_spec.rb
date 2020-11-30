require 'bowling'

describe Bowling do

  it "allows the user to enter their roll" do
    expect(subject).to respond_to(:roll).with(1).argument
  end

  it "totals the value of the rolls" do
    game = Bowling.new
    game.roll(5)
    game.roll(3)
    game.roll(4)
    expect(game.frame1).to eq 8
  end

  it "adds the bonus to a strike" do
    game = Bowling.new
    game.roll(10)
    game.roll(0)
    game.roll(5)
    game.roll(5)
    expect(game.frame1).to eq 20
  end

  it "adds the bonus to a strike if followed by anotehr strike" do
    game = Bowling.new
    game.roll(10)
    game.roll(0)
    game.roll(10)
    game.roll(0)
    game.roll(5)
    expect(game.frame1).to eq 25
  end


  it "adds the bonus to a spare" do
    game = Bowling.new
    game.roll(5)
    game.roll(5)
    game.roll(1)
    game.roll(2)
    expect(game.frame1).to eq 11
  end
end
