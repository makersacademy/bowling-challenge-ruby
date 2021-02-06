require 'player'

describe Player do

  let(:claude) { Player.new("claude") }

  it "should have an array" do
    expect(claude.scores).to be_an Array
  end

  describe ".frame" do

    it "should use the scores array to store frames" do
      claude.frame(5, 5)
      expect(claude.scores).to include([5, 5])
    end

    it "recognises a strike" do
      claude.frame(10, 0)
      expect(claude.strike).to eq(true)
      expect(claude.spare).to eq(false)
    end

    it "recognises a spare" do
      claude.frame(4, 6)
      expect(claude.spare).to eq(true)
      expect(claude.strike).to eq(false)
    end


  end

  describe ".get_scores" do

    it "keeps track of frames and scores" do
      claude.frame(5, 5)
      expect{ claude.get_scores }.to output("claude: frame 1 - roll 1: 5, roll 2: 5\n").to_stdout
    end

  end

  describe ".get_total" do

    it "outputs the total" do
      claude.frame(5, 5)
      expect{ claude.get_total }.to output("claude's total is 10\n").to_stdout
    end

  end

end
