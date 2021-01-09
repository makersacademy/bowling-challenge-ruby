require 'frame.rb'

describe Frame do

  let(:frame) {Frame.new}

  it "has a score which is initialized at zero" do
    expect(subject.score).to eq(0)
  end

  describe ".bonus_rolls" do
    it "can be used to access the bonus roll count for the frame, which is initialized at zero" do
      expect(subject.bonus_rolls).to eq(0)
    end
    it "can be used to modify the bonus roll count" do
      expect{frame.bonus_rolls += 1}.to change{frame.bonus_rolls}.by(1)
    end
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
