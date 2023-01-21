require_relative '../lib/bowling_score_card'

describe "bowling score card class" do
  # learnt about this let line during the bnb challenge
  # it saves having to create a new class instance every test!
  let(:scorecard) { BowlingScoreCard.new }

  context "user rolls 0 for every roll in 10 frame game" do
    it "gives a score of 0 at the end of the game" do
      roll_n_times(20, 0)
      expect(scorecard.overall_score).to eq 0
    end
  end

  context "user rolls 1 for every roll (20) in 10 frame game" do
    it "gives a score of 20 at the end of the game" do
      roll_n_times(20, 1)
      expect(scorecard.overall_score).to eq 20
    end
  end

  context 'user rolls one spare and then a five on next roll' do
    it "gives of a score of 18 at the end of the game" do
      scorecard.roll(5)
      scorecard.roll(5)
      scorecard.roll(4)
      roll_n_times(17, 0)
      
      expect(scorecard.overall_score).to eq 18
    end
  end

  context 'user rolls one strike then a 4 and a 5 in the next two rolls' do
    it "takes into account the strike bonus and gives a score of 28 at end of game" do
      scorecard.roll(10)
      scorecard.roll(4)
      scorecard.roll(5)
      roll_n_times(16, 0)
      expect(scorecard.overall_score).to eq 28
    end
  end

  context 'user rolls the highest score possible each roll' do
    it "returns the perfect score of 300" do
      roll_n_times(12, 10)
      expect(scorecard.overall_score).to eq 300
    end
  end

# rspec helper method
  def roll_n_times(n, pins_down)
    n.times { scorecard.roll(pins_down) }
  end
end
