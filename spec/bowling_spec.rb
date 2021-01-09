require 'bowling'

describe Bowling do

  let(:game) {Bowling.new}

  it "allows the user to enter their roll" do
    expect(subject).to respond_to(:roll).with(1).argument
  end

  it "totals the value of the rolls" do
    game.roll(5)
    game.roll(3)
    game.roll(4)
    expect(game.score).to eq 12
  end

#   it "adds the bonus to a strike" do
#     game.roll(10)
#     game.roll(0)
#     game.roll(5)
#     game.roll(5)
#     expect(game.score).to eq 20
#   end
#
#   it "adds the bonus to a strike if followed by anotehr strike" do
#     game.roll(10)
#     game.roll(0)
#     game.roll(10)
#     game.roll(0)
#     game.roll(5)
#     expect(game.score).to eq 25
#   end
#
#
#   it "adds the bonus to a spare" do
#     game.roll(5)
#     game.roll(5)
#     game.roll(1)
#     game.roll(2)
#     expect(game.score).to eq 11
#   end
end
