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
