require_relative "../lib/score"

describe Score do
  before (:each) do
    @game_score = PlayerGameScore.new
  end

  describe "#add_round" do
    it "adds the current round pins to the round_scores array" do
      fake_round = double(fake_round, :round_pins => [2, 5])
      @game_score.add_round(fake_round)

      expect(@game_score.round_scores).to eq([2, 5])
    end
  end
end