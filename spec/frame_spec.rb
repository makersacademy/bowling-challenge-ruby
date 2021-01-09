require 'frame.rb'

describe Frame do

  let(:frame) {Frame.new}

  it "has a score which is initialized at zero" do
    expect(subject.score).to eq(0)
  end
  it "has a bonus_roll_count which is initialized at zero" do
    expect(subject.bonus_rolls).to eq(0)
  end

  describe "#add_score" do
    it "takes 1 argument" do
      expect(subject).to respond_to(:add_score).with(1).argument
    end
    it "adds the given amount to the frame score" do
      expect{frame.add_score(5)}.to change{frame.score}.by(5)
    end
  end

end
