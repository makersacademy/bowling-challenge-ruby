require "frame"

describe Frame do
  describe ".frame_type" do
    it "is and open frame" do
      subject.frame_type(1, 2)
      expect(subject.type).to eq "Open"
    end

    it "is a spare frame" do
      subject.frame_type(1, 9)
      expect(subject.type).to eq "Spare"
    end

    it "is a strike" do
      subject.frame_type(10)
      expect(subject.type).to eq "Strike"
    end
  end
end
