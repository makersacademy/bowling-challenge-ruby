require "frame"

describe Frame do 

  it "knows which number frame it is" do
    Frame.new
    Frame.new
    expect(Frame.new.number).to eq 3
  end

  it "can have rolls added to it" do
    frame = Frame.new
    frame.add_roll(3)
    expect(frame.rolls).to include 3
  end


  xit "stores if it's completed" do

  end


end
