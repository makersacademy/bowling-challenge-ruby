require 'frame'

describe Frame do
  subject {described_class.new(1)}
  describe "keeping track of progress" do
    it "knows its number" do
      #subject.add_roll(2)
      expect(subject.number).to be 1
    end
  end

  context "rolls 1-9" do
    it "closes itself after two rolls and after a strike" do
      expect(subject.open).to be true
      subject.add_roll(2)
      subject.add_roll(7)
      expect(subject.open).to be false
      subject.add_roll(10)
      expect(subject.open).to be false
    end
  end


  context "roll ten" do
    it "allows third roll if strike" do
      frame_ten = described_class.new(10)
      expect(frame_ten.number).to eq 10
    end
  end
end
