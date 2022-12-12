require 'frame'

describe Frame do
  it "initializes a new frame" do
    frame = Frame.new(1)
    
    expect(frame).to be_instance_of(Frame)
    expect(frame.frame).to eq 1
  end
  it "starts a frame with a total score of 0" do
    frame = Frame.new(1)

    expect(frame.frame_score).to eq 0
  end
  it "keeps a total for the current frame" do
    frame = Frame.new(1)
    frame.add_roll_1(5)
    frame.add_roll_2(4)
    expect(frame.frame_score).to eq 9
  end
  it "can record a strike" do
    frame = Frame.new(1)

    frame.strike
    expect(frame.strike).to eq true
  end
  it "can record a spare" do
    frame = Frame.new(1)
    
    frame.spare
    expect(frame.spare).to eq true
  end

end