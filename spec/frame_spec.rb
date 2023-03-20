require 'frame'

RSpec.describe Frame do 

  it "initiates a new instance of frame" do
    frame = Frame.new
  end 

  it "keeps a score for that frame as an array of scores" do 
    frame = Frame.new
    frame.roll_one(3)
    frame.roll_two(4)
    expect(frame.frame_scores).to eq [3, 4]
  end 

  it "recognises if strike" do 
    frame = Frame.new
    frame.roll_one(10)
    expect(frame.is_strike?).to eq true 
  end 

  #add a score if strike achieved

  it "recognises if spare" do
    frame = Frame.new
    frame.roll_one(1)
    frame.roll_two(9)
    expect(frame.is_strike?).to eq false 
    expect(frame.is_spare?).to eq true 
  end 

  it "raises error if first_roll does not sit within range 0 - 10" do
    frame = Frame.new
    expect { frame.roll_one(11) }.to raise_error "you cannot knock down a negative number or more than ten pins in a frame"
  end 

  it "raises error if second_roll does not sit within range 0 - 10" do
    frame = Frame.new
    expect { frame.roll_two(-2) }.to raise_error "you cannot knock down a negative number or more than ten pins in a frame"
  end

  it "raises error if sum of first_roll and second_roll > 10" do
    frame = Frame.new
    frame.roll_one(2)
    expect { frame.roll_two(9) }.to raise_error "sum of roll_one and roll_two cannot exceed 10"
    
  end 

  it "raises error if first_score < 10 and final score is called before second score is played" do
    frame = Frame.new
    frame.roll_one(6)
    expect { frame.frame_scores }.to raise_error "you need to take another roll before final score can be calculated"
  end 

end 