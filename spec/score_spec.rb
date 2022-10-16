require_relative "../lib/score"

describe PlayerGameScore do
  before (:each) do
    @game_score = PlayerGameScore.new
  end

  describe "#add_round" do
    it "adds the current frame's pins to the round_scores array" do
      fake_round = double(fake_round, :round_pins => [2, 5], strike: false, spare: false)
    
      @game_score.add_round(fake_round)

      expect(@game_score.round_scores).to eq([7])
    end

    it "adds the next frame's points to the total points of a frame when strike" do
      fake_round1 = double(fake_round1, :round_pins => [10], strike: true, spare: false)
      @game_score.add_round(fake_round1)

      fake_round2 = double(fake_round2, :round_pins => [2, 5], strike: false, spare: false)
      @game_score.add_round(fake_round2)

      expect(@game_score.round_scores).to eq([17, 7])
    end

    it "calculates points correctly when user enters two strikes on a row" do
      fake_round1 = double(fake_round1, :round_pins => [10], strike: true, spare: false)
      @game_score.add_round(fake_round1)

      fake_round2 = double(fake_round2, :round_pins => [10], strike: true, spare: false)
      @game_score.add_round(fake_round2)

      fake_round2 = double(fake_round2, :round_pins => [2, 5], strike: false, spare: false)
      @game_score.add_round(fake_round2)

      expect(@game_score.round_scores).to eq([20, 17, 7])
    end

    it "adds the next frame's first roll points when spare" do
      fake_round1 = double(fake_round1, :round_pins => [4, 6], strike: false, spare: true)
      @game_score.add_round(fake_round1)
  
      fake_round2 = double(fake_round2, :round_pins => [2, 5], strike: false, spare: false)
      @game_score.add_round(fake_round2)
  
      expect(@game_score.round_scores).to eq([12, 7])
    end

    it "add the right number of points when two spares on a row" do
      fake_round1 = double(fake_round1, :round_pins => [4, 6], strike: false, spare: true)
      @game_score.add_round(fake_round1)

      fake_round2 = double(fake_round2, :round_pins => [3, 7], strike: false, spare: true)
      @game_score.add_round(fake_round2)

      fake_round3 = double(fake_round3, :round_pins => [1, 3], strike: false, spare: false)
      @game_score.add_round(fake_round3)

      expect(@game_score.round_scores).to eq([13, 11, 4])
    end

    it "adds the right number of points when there are a spare and a strike on a row" do
        fake_round1 = double(fake_round1, :round_pins => [4, 6], strike: false, spare: true)
        @game_score.add_round(fake_round1)
  
        fake_round2 = double(fake_round2, :round_pins => [10], strike: true, spare: false)
        @game_score.add_round(fake_round2)

        fake_round3 = double(fake_round3, :round_pins => [1, 5], strike: false, spare: false)
        @game_score.add_round(fake_round3)
        expect(@game_score.round_scores).to eq([20, 16, 6])
    end
  end
end