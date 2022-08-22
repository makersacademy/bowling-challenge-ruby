require 'app'

RSpec.describe Application do

  it "prints the score for each frame" do
    io = double :io
    
    expect(io).to receive(:puts).with('Welcome to ten pin bowling')
    expect(io).to receive(:puts).with('Frame 1')
    expect(io).to receive(:puts).with('First roll:')
    expect(io).to receive(:gets).and_return('1')
    expect(io).to receive(:puts).with('Second roll:')
    expect(io).to receive(:gets).and_return('1')
    expect(io).to receive(:puts).with('You scored 2')
    bowling = Application.new(io)
    bowling.run
  end

end