require 'scorecard'

describe Scorecard do
let (:new_scorecard) {Scorecard.new("my team")}
  it 'using the #reset_score_card method should return emptied nested hash scorecard with team name' do
    new_scorecard.add_roll(1.1, 5)
    new_scorecard.add_roll(1.2, 3)
    new_scorecard.add_roll(2.1, 2)
    new_scorecard.add_roll(2.2, 7)
    new_scorecard.reset_score_card
    expect(new_scorecard.score).to eq({"my team"=>{
      1.1=>0, 1.2=>0, 2.1=>0, 2.2=>0, }})
  end

  it 'entering scores should push to hash' do
    new_scorecard.add_roll(1.1, 5)
    new_scorecard.add_roll(1.2, 3)
    expect(new_scorecard.score).to eq({"my team"=>{
      1.1=>5, 1.2=>3 }})
  end

  it 'check that resetting scorecard then adding scores pushes to hash' do
    new_scorecard.add_roll(1.1, 5)
    new_scorecard.add_roll(1.2, 3)
    new_scorecard.add_roll(2.1, 2)
    new_scorecard.add_roll(2.2, 7)
    new_scorecard.reset_score_card
    new_scorecard.add_roll(1.1, 4)
    new_scorecard.add_roll(1.2, 1)
    expect(new_scorecard.score).to eq({"my team"=>{
      1.1=>4, 1.2=>1, 2.1=>0, 2.2=>0, }})
  end

  it 'check that resetting scorecard then adding scores pushes to hash' do
    new_scorecard.add_roll(1.1, 5)
    new_scorecard.add_roll(1.2, 3)
    expect(new_scorecard.total(1)).to eq(8)
  end

end
