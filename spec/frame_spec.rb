require 'frame'

describe Frame do
  it "initializes a new frame" do
    frame = Frame.new(1)
    
    expect(frame).to be_instance_of(Frame)
    expect(frame.frame).to eq 1
  end
end