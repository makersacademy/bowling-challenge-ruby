require 'bowling'

RSpec.describe Bowling do

  xit "welcomes you" do
    io = double :io
    bowling = Bowling.new(io)
    allow(io).to receive(:puts).with('Welcome to ten pin bowling')
    bowling.run
  end

  it "prints the score for each frame" do
    io = double :io
    bowling = Bowling.new(io)
    expect(io).to receive(:puts).with('Welcome to ten pin bowling')
    expect(io).to receive(:puts).with('Frame 1')
    expect(io).to receive(:puts).with('First roll:')
    expect(io).to receive(:gets).and_return('1')
    expect(io).to receive(:puts).with('Second roll:')
    expect(io).to receive(:gets).and_return('1')
    expect(io).to receive(:puts).with('You scored 2')
    bowling.run
  end

end