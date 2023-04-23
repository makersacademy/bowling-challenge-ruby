require 'frame'


describe Frame do
  let(:frame) { Frame.new }
  it "initializes with an empty array @rolls" do
    expect(frame.rolls).to be_an_instance_of Array
    expect(frame.rolls.empty?).to be_truthy
  end

  it "initializes with bonus points set to 0" do
    expect(frame.bonus_points).to eq 0
  end

end
