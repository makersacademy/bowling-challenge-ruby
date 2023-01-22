require 'bowling_game'


RSpec.describe BowlingGame do

  context "user rolls gutter game" do
    it "gives a final score of 0" do
      scorecard = BowlingGame.new
      20.times {scorecard.roll(0)}
      expect(scorecard.score).to eq 0
    end
  end

  context "user rolls 1, 20 times" do
    it "gives a final score of 20" do
      scorecard = BowlingGame.new
      20.times {scorecard.roll(1)}
      expect(scorecard.score).to eq 20
    end
  end

  context 'user rolls one spare and then a five on next roll, then 0, 17 times' do
    it "gives of final score of 18" do
      scorecard = BowlingGame.new
      scorecard.roll(5)
      scorecard.roll(5)
      scorecard.roll(4)
      17.times {scorecard.roll(0)}

      expect(scorecard.score).to eq 18
    end
  end

  context 'user rolls one strike then a 4 and a 5 in the next two rolls' do
    it "takes into account the strike bonus and gives a final score of 28" do
      scorecard = BowlingGame.new
      scorecard.roll(10)
      scorecard.roll(4)
      scorecard.roll(5)
      16.times {scorecard.roll(0)}
      expect(scorecard.score).to eq 28
    end
  end

  context 'user rolls the highest score possible each roll' do
    it "returns the perfect score of 300" do
      scorecard = BowlingGame.new
      12.times {scorecard.roll(10) }
      expect(scorecard.score).to eq 300
    end
  end
end