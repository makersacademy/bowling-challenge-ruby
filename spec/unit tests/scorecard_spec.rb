require_relative "../../lib/scorecard.rb"

describe ScoreCard do

  #it will get user input to send to scoretracker
  describe '#initialize' do
    it 'creates a new instance of ScoreTracker' do
      card = ScoreCard.new
      expect(card.scores).to be_a ScoreTracker
    end
  end
  #it will present score after each roll
  #it will say whether a game was perfect or a gutter game
end
