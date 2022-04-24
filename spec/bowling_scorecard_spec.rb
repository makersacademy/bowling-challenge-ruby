require './lib/bowling_scorecard'

describe Scorecard do
  scorecard = Scorecard.new
  describe '#roll' do
    it 'lets players to make rolls' do
      expect(scorecard).to respond_to(:roll).with(1).argument
    end
  end
end
