require 'frame'

describe Frame do
  it "should return 10 for a strike" do
    io = double
    frame = Frame.new(1,io)
    expect(io).to receive(:puts).with("Please input your roll:")
    expect(io).to receive(:gets).and_return("10")
    expect(frame.roll).to eq([10])
  end

  it "should return 10 3 times for frame 10" do
    io = double
    frame = Frame.new(10,io)
    expect(io).to receive(:puts).with("Please input your roll:").exactly(3).times
    expect(io).to receive(:gets).and_return("10").exactly(3).times
    expect(frame.roll).to eq([10,10,10])
  end

  it "should return 2,8,10 for frame 10 with a spare" do
    io = double
    frame = Frame.new(10,io)
    expect(io).to receive(:puts).with("Please input your roll:").exactly(3).times
    expect(io).to receive(:gets).and_return("2","8","10")
    expect(frame.roll).to eq([2,8,10])
  end

  it "should return 2,8 for frame 9 with a split" do
    io = double
    frame = Frame.new(9,io)
    expect(io).to receive(:puts).with("Please input your roll:").exactly(2).times
    expect(io).to receive(:gets).and_return("2","8")
    expect(frame.roll).to eq([2,8])
  end

  it "should return 2,7 for frame 9 with a spare" do
    io = double
    frame = Frame.new(9,io)
    expect(io).to receive(:puts).with("Please input your roll:").exactly(2).times
    expect(io).to receive(:gets).and_return("2","7")
    expect(frame.roll).to eq([2,7])
  end

  it "should return 10 for frame 9 with a strike" do
    io = double
    frame = Frame.new(9,io)
    expect(io).to receive(:puts).with("Please input your roll:")
    expect(io).to receive(:gets).and_return("10")
    expect(frame.roll).to eq([10])
  end

end