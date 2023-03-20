require_relative "../lib/scorecard"

RSpec.describe do
  let(:scorecard) { Scorecard.new }

  describe "#initialize" do
    it "creates a new Scorecard object with correct initial values" do
      scorecard = Scorecard.new

      expect(scorecard.frame_number).to eq(1)
      expect(scorecard.score_so_far).to eq(0)
      expect(scorecard.game_over?).to be_falsey
      expect(scorecard.instance_variable_get(:@state)).to eq(1)
      # expect(scorecard.instance_variable_get(:@state)).to eq(Scorecard::ROLLING_FIRST_BALL) - equivalent
    end
  end

  describe "#roll" do #unsure about this one
    it "updates the scorecard after 1st roll" do
    # in the description it says test a single roll that's not a strike'
      result = scorecard.roll(1)

      expect(result.length).to eq(1)
      expect(scorecard.frame_number).to eq(1)
      expect(scorecard.score_so_far).to eq(0)
      expect(scorecard.game_over?).to be_falsey
      # expect(scorecard.state).to eq(:rolling_second_ball)
      expect(scorecard.instance_variable_get(:@state)).to eq(2)

    end
    it "updates the scorecard after frame 1 miss" do
      result = scorecard.roll(1)

      expect(result.length).to eq(1)
      expect(result[0]).to eq(3)
      expect(scorer.frame_number).to eq(2)
      expect(scorer.score_so_far).to eq(3)
      expect(scorer.game_is_over).to eq(false)
    end
  end

  

  # my old code below
  context "when given an input" do
    xit "updates the scorecard" do
      scorecard.add_score(2)
      expect(scorecard.total_score).to eq(2)
      scorecard.add_score(5)
      expect(scorecard.total_score).to eq(7)
      scorecard.add_score(8)
      expect(scorecard.total_score).to eq(15)
    end
  end
end