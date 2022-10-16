require_relative "../lib/score"

describe PlayerGameScore do
  before (:each) do
    @game_score = PlayerGameScore.new
  end

  describe "#add_round" do
    it "adds the current frame's pins to the round_scores array" do
      fake_round = double(fake_round, :round_pins => [2, 5], :strike => false)
    
      @game_score.add_round(fake_round)

      expect(@game_score.round_scores).to eq([7])
    end

    it "adds the next frame's points to the total points of a frame when strike" do
      fake_round1 = double(fake_round1, :round_pins => [10], strike: true)
      @game_score.add_round(fake_round1)

      fake_round2 = double(fake_round2, :round_pins => [2, 5], strike: false)
      @game_score.add_round(fake_round2)

      expect(@game_score.round_scores).to eq([17, 7])
    end

    it "calculates points correctly when user enters two strikes on a row" do
      fake_round1 = double(fake_round1, :round_pins => [10], strike: true)
      @game_score.add_round(fake_round1)

      fake_round2 = double(fake_round2, :round_pins => [10], strike: true)
      @game_score.add_round(fake_round2)

      fake_round2 = double(fake_round2, :round_pins => [2, 5], strike: false)
      @game_score.add_round(fake_round2)

      expect(@game_score.round_scores).to eq([20, 17, 7])
    end

    xit "adds the next frame's first roll points when spare" do
      fake_round1 = double(fake_round1, :round_pins => [10], strike: true)
      @game_score.add_round(fake_round1)
  
      fake_round2 = double(fake_round2, :round_pins => [2, 5], strike: false)
      @game_score.add_round(fake_round2)
  
      expect(@game_score.round_scores).to eq([17, 7])
    end
  end
end