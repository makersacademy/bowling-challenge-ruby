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

    it "doubles the score on both rolls for a strike" do
      claude.frame(10, 0)
      claude.frame(6, 3)
      expect(claude.scores[0]).to eq([10, 0])
      expect(claude.scores[1]).to eq([12, 6])
    end

    it "doubles the score on first roll for a spare" do
      claude.frame(5, 5)
      claude.frame(6, 3)
      expect(claude.scores[0]).to eq([5, 5])
      expect(claude.scores[1]).to eq([12, 3])
    end

    it "knows what frame is being played" do
      claude.frame(5,5)
      expect(claude.frame_count).to eq(1)
    end

    it "can count frames" do
      10.times do
        claude.frame(3,5)
      end
      expect(claude.frame_count).to eq(10)
    end

    it "knows when it's the final frame" do
      10.times do
        claude.frame(5,5)
      end
      expect(claude.final_frame).to be(true)
      end

      it "gives a player two more rolls if they score a strike on final frame" do
      9.times do
        claude.frame(3,5)
      end
      claude.frame(10, 0)
      expect(claude.frame_count).to be(8)
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

  describe ".check_bonus" do

    it "updates bonus values for a strike" do
      claude.frame(10, 0)
      claude.check_bonus
      expect(claude.bonus_1).to eq(2)
      expect(claude.bonus_2).to eq(2)
    end


    it "updates bonus values for a spare" do
      claude.frame(5, 5)
      claude.check_bonus
      expect(claude.bonus_1).to eq(2)
      expect(claude.bonus_2).to eq(1)
    end


    it "resets bonuses when it's not a strike or spare" do
      claude.frame(2, 5)
      claude.check_bonus
      expect(claude.bonus_1).to eq(1)
      expect(claude.bonus_2).to eq(1)
    end


  end

end
