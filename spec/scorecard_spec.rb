require 'scorecard'

describe ScoreCard do
  let(:scorecard) { described_class.new }

  it "should create a new scorecard" do
    expect(scorecard).to be_a(ScoreCard)
  end

  it "should score a new game for a single player" do
    expect(scorecard).to respond_to(:run).with(0).arguments
  end

  describe '#roll_1_input' do
    it "should take a user input for their first roll" do
      expect(scorecard).to receive(:gets).and_return("5\n")
      scorecard.roll_1_input
    end

    it "should add the inputted score for roll 1 to frame_score" do
      allow(scorecard).to receive(:gets).and_return("5\n")
      scorecard.roll_1_input
      expect(scorecard.frame_score).to eq([5])
    end

    it "should add the inputted score for roll 1 to scores" do
      allow(scorecard).to receive(:gets).and_return("5\n")
      scorecard.roll_1_input
      expect(scorecard.scores).to eq([5])
    end
  end

  describe '#roll_2_input' do
    it "should take a user input for their second roll" do
      expect(scorecard).to receive(:gets).and_return("2\n")
      scorecard.roll_2_input
    end

    it "should add the inputted score for roll 2 to frame_score" do
      allow(scorecard).to receive(:gets).and_return("2\n")
      scorecard.roll_2_input
      expect(scorecard.frame_score).to include(2)
    end

    it "should add the inputted score for roll 2 to scores" do
      allow(scorecard).to receive(:gets).and_return("2\n")
      scorecard.roll_2_input
      expect(scorecard.scores).to include(2)
    end
  end

  describe '#bonus_roll_input' do
    it "should take a user input for their bonus roll" do
      expect(scorecard).to receive(:gets).and_return("8\n")
      scorecard.bonus_roll_input
    end

    it "should add the inputted score for roll 2 to frame_score" do
      allow(scorecard).to receive(:gets).and_return("8\n")
      scorecard.bonus_roll_input
      expect(scorecard.frame_score).to include(8)
    end

    it "should add the inputted score for roll 2 to frame_score" do
      allow(scorecard).to receive(:gets).and_return("8\n")
      scorecard.bonus_roll_input
      expect(scorecard.scores).to include(8)
    end
  end

  describe '#strike?' do
    it "should return true if the user rolls a strike in a single frame" do
      allow(scorecard).to receive(:gets).and_return("10\n")
      scorecard.roll_1_input
      expect(scorecard.strike?).to eq(true)
    end
  end

  describe '#spare?' do
    it "should return true if the user rolls a spare in a single frame" do
      allow(scorecard).to receive(:gets).and_return("4\n")
      scorecard.roll_2_input
      allow(scorecard).to receive(:gets).and_return("6\n")
      scorecard.roll_1_input
      expect(scorecard.spare?).to eq(true)
    end
  end

  describe '#clear_frame' do
    it "clears frame_score after a single frame" do
      allow(scorecard).to receive(:gets).and_return("10\n")
      scorecard.roll_1_input
      expect(scorecard.clear_frame).to eq([])
    end
  end

  describe '#final_calc' do
    it "calculates the running_score" do
      allow(scorecard).to receive(:gets).and_return("10\n")
      expect(scorecard).to receive(:final_calc)
      scorecard.run
    end
  end

  describe '#run' do
    it "runs a gutter game and reveals the score" do
      allow(scorecard).to receive(:gets).and_return("0\n")
      scorecard.roll_1_input
      allow(scorecard).to receive(:gets).and_return("0\n")
      scorecard.roll_2_input
      allow(scorecard).to receive(:final_calc)
      scorecard.run
      expect(scorecard.running_score.sum).to eq(0)
    end
  end

end
