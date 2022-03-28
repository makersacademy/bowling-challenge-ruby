require 'frame'

describe Frame do

  let(:frame) { Frame.new(6) }

  it "should take one argument when initialised" do
    expect { frame }.to_not raise_error
    expect { Frame.new }.to raise_error ArgumentError
  end

  it "should be able to roll and add score to roll_1" do
    expect { frame.roll(3) }.to change { frame.roll_1 }.from(nil).to(3)
  end

  it "should be able to roll and add score to roll_2" do
    frame.roll(4)
    expect { frame.roll(3) }.to change { frame.roll_2 }.from(nil).to(3)
  end

  it "should be able to check whether a spare has been rolled" do
    frame.roll(3)
    frame.roll(7)
    expect(frame).to be_spare
  end

  it "should be able to check whether a spare has not been rolled" do
    frame.roll(2)
    frame.roll(6)
    expect(frame).to_not be_spare
  end

  it "should be able to check whether a strike has been rolled" do
    frame = Frame.new(2)
    frame.roll(10)
    expect(frame).to be_strike
  end
  
  it "should be able to check whether a strike has not been rolled" do
    expect(frame).to_not be_strike
  end

  it "should check if a frame is complete" do
    frame.roll(10)
    expect(frame).to be_complete
  end

  it "should check if a game is not complete" do
    expect(frame).to_not be_complete
  end

  it "should be able to add a bonus roll to roll_3 if roll_1 and roll_2 are greater than or equal to 10 and turn passed is 10" do
    strike = Frame.new(10)
    strike.roll(10)
    strike.roll(10)

    expect { strike.roll(3) }.to change { strike.roll_3 }.from(nil).to(3)
  end

  it "should raise an error if you try and roll when a game is complete" do
    frame.roll(10)

    expect { frame.roll(2) }.to raise_error "This frame is complete"
  end

end
