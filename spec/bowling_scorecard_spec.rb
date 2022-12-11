require "bowling_scorecard"

RSpec.describe Application do

  describe "frame 1" do
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

  describe "frame 2" do
    xcontext "when user did not score a strike or spare in previous frame" do
      it "tallies up and puts total score" do
        io = double :io
        app = Application.new(io)

        expect(io).to receive(:puts).with("Frame 1")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first bowl?")
        expect(io).to receive(:gets).and_return("5")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second bowl?")
        expect(io).to receive(:gets).and_return("2")
        expect(io).to receive(:puts).with("Total score at the end of frame 1: 7")

        expect(io).to receive(:puts).with("Frame 2")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first bowl?")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second bowl?")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Total score at the end of frame 2: 12")

        app.run
      end
    end
  end
end

RSpec.describe "#calculate_score" do
  context "at end of first frame with rolls of 4 and 2" do
    it "returns 6" do
      io = double :io
      app = Application.new(io, 4, 2)

      expect(app.calculate_score).to eq(6)
    end
  end

  context "at end of third frame with scores of 5, 6, then rolls of 5 and 4" do
    it "returns 20" do
      io = double :io
      app = Application.new(io, 5, 4, 11, "none", "none", 0, 3)

      expect(app.calculate_score).to eq(20)
    end
  end

  context "at end of second frame with a strike, then rolls of 5 and 3" do
    it "returns 26" do
      io = double :io
      app = Application.new(io, 5, 3, 10, "strike", "none", 1, 2)

      expect(app.calculate_score).to eq(26)
    end
  end

  context "at end of third frame with 9, then a spare, then rolls of 3 and 2" do
    it "returns 27" do
      io = double :io
      app = Application.new(io, 3, 2, 19, "spare", "none", 0, 3)

      expect(app.calculate_score).to eq(27)
    end
  end

  context "at end of second frame with two strikes in a row" do
    it "returns 30" do
      io = double :io
      app = Application.new(io, 10, 0, 10, "strike", "strike", 2, 2)

      expect(app.calculate_score).to eq(30)
    end
  end

  context "at end of third frame with three strikes in a row" do
    it "returns 60" do
      io = double :io
      app = Application.new(io, 10, 0, 30, "strike", "strike", 3, 3)

      expect(app.calculate_score).to eq(60)
    end
  end

  context "at end of fourth frame with four strikes in a row" do
    it "returns 90" do
      io = double :io
      app = Application.new(io, 10, 0, 60, "strike", "strike", 4, 4)

      expect(app.calculate_score).to eq(90)
    end
  end
end

RSpec.describe "#calculate_bonus_rolls" do
  context "if less than 10 frames have taken place" do
    it "returns error message" do
      io = double :io
      app = Application.new(io)
      expect(io).to receive(:puts).with("Bonus rolls only take place after scoring a strike or spare in the 10th frame")
      
      app.calculate_bonus_rolls
    end
  end

  context "if a strike is rolled in tenth frame and two more rolls take place" do
    it "adds the score of the bonus rolls to the total_score" do
      io = double :io
      app = Application.new(io, 4, 3, 100, "strike", "none", 1, 11)

      expect(app.calculate_bonus_rolls).to eq(107)
    end
  end

  context "if a spare is rolled in tenth frame and one more roll takes place" do
    it "adds the score of the bonus roll to the total_score" do
      io = double :io
      app = Application.new(io, 6, 3, 120, "spare", "none", 0, 11)

      expect(app.calculate_bonus_rolls).to eq(126)
    end
  end
end