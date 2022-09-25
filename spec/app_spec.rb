require_relative '../app'

describe Application do
  it "returns a user input if its an integer from 0-10" do
    io = double(:io)
    app = Application.new(io)
    expect(io).to receive(:puts).with("Round 1")
    expect(io).to receive(:puts).with("First Roll:")
    expect(io).to receive(:gets).and_return("7")
    expect(app.ask_for_roll(1, 1)).to eq 7
  end

  it "returns a user input if its an integer from 0-10" do
    io = double(:io)
    app = Application.new(io)
    expect(io).to receive(:puts).with("Round 1")
    expect(io).to receive(:puts).with("First Roll:")
    expect(io).to receive(:gets).and_return("10")
    expect(app.ask_for_roll(1, 1)).to eq 10
  end

  it "returns a user input if its an integer from 0-10" do
    io = double(:io)
    app = Application.new(io)
    expect(io).to receive(:puts).with("Round 1")
    expect(io).to receive(:puts).with("First Roll:")
    expect(io).to receive(:gets).and_return("0")
    expect(app.ask_for_roll(1, 1)).to eq 0
  end

  it "returns a correct score for a round" do
    io = double(:io)
    app = Application.new(io)
    expect(io).to receive(:puts).with("Round 1")
    expect(io).to receive(:puts).with("First Roll:")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Second Roll:")
    expect(io).to receive(:gets).and_return("4")
    expect(io).to receive(:puts).with("Round - Roll 1 - Roll 2 - Roll 3 - Score")
    expect(io).to receive(:puts).with("  1   -    3   -    4   -    /   -   7")
    app.run
  end

  it "returns a correct score for a strike" do
    io = double(:io)
    app = Application.new(io)
    expect(io).to receive(:puts).with("Round 1")
    expect(io).to receive(:puts).with("First Roll:")
    expect(io).to receive(:gets).and_return("10")
    expect(io).to receive(:puts).with("STRIKE!")
    expect(io).to receive(:puts).with("Round - Roll 1 - Roll 2 - Roll 3 - Score")
    expect(io).to receive(:puts).with("  1   -    10   -       -    /   -   10")
    app.run
  end

  it "adds the score of the two rolls in the next round as bonus to first round" do
    io = double(:io)
    app = Application.new(io)
    expect(io).to receive(:puts).with("Round 1")
    expect(io).to receive(:puts).with("First Roll:")
    expect(io).to receive(:gets).and_return("10")
    expect(io).to receive(:puts).with("STRIKE!")
    expect(io).to receive(:puts).with("Round - Roll 1 - Roll 2 - Roll 3 - Score")
    expect(io).to receive(:puts).with("  1   -    10   -       -    /   -   10")
    expect(io).to receive(:puts).with("Round 2")
    expect(io).to receive(:puts).with("First Roll:")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Second Roll:")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("Round - Roll 1 - Roll 2 - Roll 3 - Score")
    expect(io).to receive(:puts).with("  1   -    10   -       -    /   -   15")
    expect(io).to receive(:puts).with("  2   -    3   -    2   -    /   -   5")
    app.run
  end
end