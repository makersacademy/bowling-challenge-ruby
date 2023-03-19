require_relative "../lib/scorecard"

RSpec.describe do
  let(:scorecard) { Scorecard.new }

  context "when given an input" do
    it "updates the scorecard" do
      scorecard.add_score(2)
      expect(scorecard.total_score).to eq(2)
      scorecard.add_score(5)
      expect(scorecard.total_score).to eq(7)
      scorecard.add_score(8)
      expect(scorecard.total_score).to eq(15)
    end
  end
end