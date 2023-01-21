require_relative "../lib/bowling"

RSpec.describe Bowling do
  it "Greets the user, asks for the names of players and reads them back" do
    io = double :io
    game1 = Bowling.new(io)
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
    game1 = Bowling.new(io)

    allow(io).to receive(:puts).with("Welcome to Bowling")
    allow(io).to receive(:puts).with("Please enter the names of the players or type S to stop")
    allow(io).to receive(:puts).with("Player 1's name:")
    allow(io).to receive(:puts).with("Player 2's name:")
    allow(io).to receive(:puts).with("Player 3's name:")
    allow(io).to receive(:gets).and_return("Adam", "Dave", "Bill", "s")
    game1.greeter

    expect(game1.scorecard_setup).to eq([{'Adam' => []}, {'Dave'=> []}, {'Bill'=> []}])
  end

  it "checks if the player bowled a spare" do
    io = double :io
    game1 = Bowling.new(io)
    expect(game1.check_spare(2,8)).to eq true
  end

  it "checks if the player did not bowl a spare" do
    io = double :io
    game1 = Bowling.new(io)
    expect(game1.check_spare(2,3)).to eq false
  end

  it "checks if the player bowled a strike" do
    io = double :io
    game1 = Bowling.new(io)
    expect(game1.check_strike(10)).to eq true
  end

  it "checks if the player did not bowl a strike" do
    io = double :io
    game1 = Bowling.new(io)
    expect(game1.check_strike(9)).to eq false
  end

  it "checks if the player has had two rolls" do
    io = double :io
    game1 = Bowling.new(io)
    scorecard = {'Adam'=>[2,3]}
    player_name = 'Adam'
    expect(game1.check_rolls(scorecard, player_name)).to eq true
  end
end