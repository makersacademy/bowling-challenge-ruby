require 'frame'

describe Frame do
  let(:frame) { Frame.new(1) }

  describe "new" do
    it 'should respond to new with 3 arguments' do
      expect(Frame).to respond_to(:new).with(1).arguments
    end

    it "should record the frame number" do
      expect(frame.number).to eq 1
    end
  end

  describe "add_roll" do
    it "should record the number of knocked down pins for a roll" do
      frame.add_roll(7)
      expect(frame.rolls).to include 7
    end
  end

  describe "add_bonus" do
    it "should record the bonus for strikes or spares" do
      frame.add_bonus(7)
      expect(frame.bonus).to eq 7
    end
  end
end
