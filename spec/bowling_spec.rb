require_relative "../lib/bowling"

RSpec.describe Game do
  it "Greets the user, asks for the names of players and reads them back" do
    io = double :io
    game1 = Game.new(io)
    allow(io).to receive(:puts).with("Welcome to Bowling")
    allow(io).to receive(:puts).with("Please enter the names of the players or type S to stop")
    allow(io).to receive(:puts).with("Player 1's name:")
    allow(io).to receive(:puts).with("Player 2's name:")
    allow(io).to receive(:puts).with("Player 3's name:")
    allow(io).to receive(:gets).and_return("Adam", "Dave", "Bill", "s")
    expect(game1.greeter).to eq(['Adam', 'Dave', 'Bill'])
  end

  it "takes the names of the players and sets up a scorecard for each" do
    io = double :io
    game1 = Game.new(io)

    allow(io).to receive(:puts).with("Welcome to Bowling")
    allow(io).to receive(:puts).with("Please enter the names of the players or type S to stop")
    allow(io).to receive(:puts).with("Player 1's name:")
    allow(io).to receive(:puts).with("Player 2's name:")
    allow(io).to receive(:puts).with("Player 3's name:")
    allow(io).to receive(:gets).and_return("Adam", "Dave", "Bill", "s")
    game1.greeter

    expect(game1.scorecard_setup).to eq([{'Adam' => []}, {'Dave'=> []}, {'Bill'=> []}])
  end
end