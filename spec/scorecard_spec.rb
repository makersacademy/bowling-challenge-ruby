require 'scorecard'

describe Scorecard do
let (:new_scorecard) {Scorecard.new("my team")}
  it 'giving a team name should return empty nested hash scorecard with team name' do
    expect(new_scorecard.score).to eq({"my team"=>{
      1.1=>0, 1.2=>0, 2.1=>0, 2.2=>0, 3.1=>0, 3.2=>0, 4.1=>0, 4.2=>0, 5.1=>0, 5.2=>0, 6.1=>0, 6.2=>0, 7.1=>0, 7.2=>0, 8.1=>0, 8.2=>0, 9.1=>0, 9.2=>0, 10.1=>0, 10.2=>0, 10.3=>0}})
  end

  it 'giving a team name should return empty nested hash scorecard with team name' do
    new_scorecard.add_roll(1.1, 5)
    new_scorecard.add_roll(1.2, 3)
    expect(new_scorecard.score).to eq({"my team"=>{
      1.1=>5, 1.2=>3, 2.1=>0, 2.2=>0, 3.1=>0, 3.2=>0, 4.1=>0, 4.2=>0, 5.1=>0, 5.2=>0, 6.1=>0, 6.2=>0, 7.1=>0, 7.2=>0, 8.1=>0, 8.2=>0, 9.1=>0, 9.2=>0, 10.1=>0, 10.2=>0, 10.3=>0}})
  end

end
