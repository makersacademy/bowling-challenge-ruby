require 'frame'

RSpec.describe Frame do 

  it "initiates a new instance of frame" do
    frame = Frame.new
  end 

  it "keeps a score for that frame" do 
    frame = Frame.new
    frame.roll_one(3)
    frame.roll_two(4)
    expect(frame.final_score).to eq 7
  end 

  it "recognises if strike" do 
    frame = Frame.new
    frame.roll_one(10)
    expect(frame.is_strike?).to eq true 
  end 

  #add a score if strike achieved

  xit "recognises if spare" do
    frame = Frame.new
    frame.play(1,9)
    expect(frame.is_strike?).to eq false 
    expect(frame.spare).to eq true 
  end 

  xit "raises error if rolls do not sit within range 0 - 10" do
    frame = Frame.new
    expect { frame.play(1,10) }.to raise_error "you cannot knock down more than ten pins in a frame"
  end 

  xit "raises error if first roll < 10 and second roll is empty" do
    frame = Frame.new
    expect { frame.play(6) }.to raise_error "need to enter a second roll value"
  end 

end 