require 'game'
require 'frame'

describe Game do
  it "should return 300 for a perfect game" do
    io = double
    game = Game.new(io)
    expect(io).to receive(:puts).with("Welcome to the Bowling Game!")
    expect(io).to receive(:puts).with("Please input your roll:").exactly(12).times
    expect(io).to receive(:gets).and_return("10").exactly(12).times
    expect(game.start).to eq([10,10,10,10,10,10,10,10,10,10,10,10])
  end

  it "should return 120 for a split game" do
    io = double
    game = Game.new(io)
    expect(io).to receive(:puts).with("Welcome to the Bowling Game!")
    expect(io).to receive(:puts).with("Please input your roll:").exactly(21).times
    expect(io).to receive(:gets).and_return("2","8","2","8","2","8","2","8","2","8")
    expect(io).to receive(:gets).and_return("2","8","2","8","2","8","2","8","2","8")
    expect(io).to receive(:gets).and_return("2")
    expect(game.start).to eq([2,8]*10 + [2])
  end

  it "should return 120 for a split game" do
    io = double
    game = Game.new(io)
    expect(io).to receive(:puts).with("Welcome to the Bowling Game!")
    expect(io).to receive(:puts).with("Please input your roll:").exactly(16).times
    expect(io).to receive(:gets).and_return("10","2","8","10","2","8","10")
    expect(io).to receive(:gets).and_return("2","8","10","2","8","2","8","2","7")
    expect(game.start).to eq([10,2,8,10,2,8,10,2,8,10,2,8,2,8,2,7])
  end

end