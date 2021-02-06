require "frame"

describe Frame do 

  it "knows which number frame it is" do
    Frame.new
    Frame.new
    expect(Frame.new.number).to eq 3
  end

  context "contains rolls, frames 1-9" do

    let(:frame) { Frame.new }

    it "can have rolls added to it" do
      frame.add_roll(3)
      expect(frame.rolls).to include 3
    end


    it "knows if frame is ended (except 10th frame)" do
      frame.add_roll(3)
      frame.add_roll(2)
      expect(frame).to be_completed
    end

    it "knows if frame ended with a strike (except 10th frame)" do
      frame.add_roll(10)
      expect(frame).to be_completed
    end

  end

  context "10th frame" do

    before do
      @frame = Frame.new
      allow(@frame).to receive(:number).and_return 10
    end

    it "is completed with 2 rolls if no strike/spare" do
      @frame.add_roll(3)
      @frame.add_roll(2)
      expect(@frame).to be_completed
    end

    it "is not completed with 2 rolls if a spare" do
      @frame.add_roll(3)
      @frame.add_roll(7)
      expect(@frame).not_to be_completed
    end

    it "is completed with 3 rolls if a spare/strike" do
      @frame.add_roll(10)
      @frame.add_roll(7)
      @frame.add_roll(8)
      expect(@frame).to be_completed
    end

  end


end
