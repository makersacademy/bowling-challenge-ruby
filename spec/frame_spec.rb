require "frame"

RSpec.describe Frame do 
  it "calculates score when ball is rolled" do 
    frame = Frame.new(1,2)
    result = frame.total_score
    expect(result).to eq 3
  end

  it "true when roll_1 is a strike" do 
    frame = Frame.new(10,0)
    result = frame.strike
    expect(result).to eq true 
  end

  it "false if roll_2 is a score of 10" do 
    frame = Frame.new(0,10) 
    result = frame.strike
    expect(result).to eq false 
  end

  xit "true if there is spare" do 
    frame = Frame.new(1,9)
    result = frame.spare
    expect(result).to eq true 
  end

  xit "false if not a spare" do 
    frame = Frame.new(1,1)
    result = frame.spare
    expect(result).to eq false
  end 
end 