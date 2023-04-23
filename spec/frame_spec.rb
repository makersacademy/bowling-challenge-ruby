require 'frame'


describe Frame do
  it "initializes with an empty array @rolls" do
    frame = Frame.new
    expect(frame.rolls).to be_an_instance_of Array
    expect(frame.rolls.empty?).to be_truthy
  end
end
