require "bowling_scorecard"

RSpec.describe Application do

  describe "first frame" do
    context "when user scores a strike" do
      it "puts strike message, puts total score of 10" do
        io = double :io
        app = Application.new(io)

        expect(io).to receive(:puts).with("Frame 1")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first bowl?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")
        expect(io).to receive(:puts).with("Total score at the end of frame 1: 10")

        app.run
      end
    end

    context "when user scores a spare" do
      it "puts spare message, puts total score of 10" do
        io = double :io
        app = Application.new(io)

        expect(io).to receive(:puts).with("Frame 1")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first bowl?")
        expect(io).to receive(:gets).and_return("7")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second bowl?")
        expect(io).to receive(:gets).and_return("3")
        expect(io).to receive(:puts).with("Spare!")
        expect(io).to receive(:puts).with("Total score at the end of frame 1: 10")

        app.run
      end
    end

    context "when user doesn't score a strike or spare" do
      it "puts total score (of less than 10)" do
        io = double :io
        app = Application.new(io)

        expect(io).to receive(:puts).with("Frame 1")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first bowl?")
        expect(io).to receive(:gets).and_return("5")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second bowl?")
        expect(io).to receive(:gets).and_return("2")
        expect(io).to receive(:puts).with("Total score at the end of frame 1: 7")

        app.run
      end
    end
  end
end