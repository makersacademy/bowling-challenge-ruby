require 'frame'

RSpec.describe Frame do
  it "initializes with an empty array" do
    frame = Frame.new
    expect(frame.frame_score).to eq []
  end

  it "initializes with closed as false" do
    frame = Frame.new
    expect(frame.closed?).to eq false
  end

  it "records the score of a roll" do
    frame = Frame.new
    frame.roll(3)
    expect(frame.frame_score).to eq [3]
    expect(frame.pins_left).to eq 7
  end

  it "records the score of two rolls, no strike or spare" do
    frame = Frame.new
    frame.roll(4)
    frame.roll(5)
    expect(frame.frame_score).to eq [4, 5]
    expect(frame.frame_total).to eq 9
  end

  it "records a strike and closes frame" do
    frame = Frame.new
    frame.roll(10)
    expect(frame.closed?).to eq true
  end

  it "records a spare and closes frame" do
    frame = Frame.new
    frame.roll(6)
    frame.roll(4)
    expect(frame.closed?).to eq true
    expect(frame.roll_counter).to eq 2
  end

  xcontext "if a strike is bowled" do
    it "adds the next two roll scores as a bonus" do
      frame = Frame.new
      frame.roll(10)
      frame.bonus
      expect(frame.frame_score).to eq 
    end
  end
end


