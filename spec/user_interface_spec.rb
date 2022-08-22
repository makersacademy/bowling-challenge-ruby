require "user_interface"

RSpec.describe UserInterface do
  it "adds one frame, shows score, invalid option, and ends the game" do
    io = double :io
    game = double :game, frames: nil
    expect(io).to receive(:puts).with("Welcome to your bowling scorecard!").ordered
    expect(io).to receive(:puts).with("The game has started.").ordered
    expect(io).to receive(:puts).with("You're on frame number 1.").ordered
    expect(io).to receive(:puts).with("Please choose an option").ordered
    expect(io).to receive(:puts).with("1. Play next frame").ordered
    expect(io).to receive(:puts).with("2. Show my score").ordered
    expect(io).to receive(:puts).with("3. End game").ordered
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("Enter score for first roll")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("Enter score for second roll")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("You're on frame number 2.").ordered
    expect(io).to receive(:puts).with("Please choose an option").ordered
    expect(io).to receive(:puts).with("1. Play next frame").ordered
    expect(io).to receive(:puts).with("2. Show my score").ordered
    expect(io).to receive(:puts).with("3. End game").ordered
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with(2).ordered
    expect(io).to receive(:puts).with("You're on frame number 2.").ordered
    expect(io).to receive(:puts).with("Please choose an option").ordered
    expect(io).to receive(:puts).with("1. Play next frame").ordered
    expect(io).to receive(:puts).with("2. Show my score").ordered
    expect(io).to receive(:puts).with("3. End game").ordered
    expect(io).to receive(:gets).and_return("5")
    expect(io).to receive(:puts).with("Please choose one of the listed options").ordered
    expect(io).to receive(:puts).with("You're on frame number 2.").ordered
    expect(io).to receive(:puts).with("Please choose an option").ordered
    expect(io).to receive(:puts).with("1. Play next frame").ordered
    expect(io).to receive(:puts).with("2. Show my score").ordered
    expect(io).to receive(:puts).with("3. End game").ordered
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("The game has finished").ordered
    UserInterface.new(io).start_game
  end
end
