require 'frame'


RSpec.describe "first frame" do
  it "shows the first role in the first frame" do
    frame = Frame.new
    frame.add_to_frame(3)
    expect(frame.total).to eq 3
  end

  it "shows total of frame" do
    frame = Frame.new
    frame.add_to_frame(3)
    frame.add_to_frame(4)
    expect(frame.total).to eq(7)
  end

  it "show a spare" do
    frame = Frame.new
    frame.add_to_frame(7)
    frame.add_to_frame(3)
    expect(frame.spare).to eq true
  end

  it "show no spares" do
    frame = Frame.new
    frame.add_to_frame(1)
    frame.add_to_frame(2)
    expect(frame.spare).to eq false
  end

  it "show strike" do
    frame = Frame.new
    frame.add_to_frame(10)
    expect(frame.strike).to eq true
  end

  it "show frame is not a strike" do
    frame = Frame.new
    frame.add_to_frame(3)
    expect(frame.strike).to eq false
  end


end