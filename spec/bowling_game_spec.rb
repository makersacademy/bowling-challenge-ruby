require "bowling_game"
RSpec.describe BowlingGame do
  describe "behavior" do
    before do
      @gm = described_class.new
    end

    it "can roll" do
      20.times { @gm.roll 0 }
      expect(@gm.score).to eq 0
    end

    it "can roll all ones" do
      20.times { @gm.roll 1 }
      expect(@gm.score).to eq 20
    end

    it "can roll a spare" do
      @gm.roll 5
      @gm.roll 5
      @gm.roll 3
      17.times { @gm.roll 0 }
      expect(@gm.score).to eq 16
    end
  end
end
