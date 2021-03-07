require 'scorecard'

describe Scorecard do
  it 'shows the score of a gutter game' do
    scorecard = Scorecard.new
    20.times{scorecard.player_roll(0)}
    expect(scorecard.points).to eq 0
  end
  it 'can implement the scoring system of a spare' do
   scorecard = Scorecard.new
   scorecard.player_roll(7)
   scorecard.player_roll(3)
   scorecard.player_roll(5)
   17.times{scorecard.player_roll(0)}
   expect(scorecard.points).to eq 20
 end
end
