require_relative "../lib/score"

describe PlayerGameScore do
  before (:each) do
    @game_score = PlayerGameScore.new
  end

  describe "#add_round" do
    it "adds the current frame's pins to the round_scores array" do
      fake_round = double(fake_round, :round_pins => [2, 5])
    
      @game_score.add_round(fake_round)

      expect(@game_score.round_scores).to eq([7])
    end

    it "duplicates the next frame's points when strike" do
      fake_round1 = double(fake_round, :round_pins => [10])
      @game_score.add_round(fake_round1)

      fake_round2 = double(fake_round, :round_pins => [2, 5])
      @game_score.add_round(fake_round2)

      expect(@game_score.round_scores).to eq([17, 7])
    end
  end
end