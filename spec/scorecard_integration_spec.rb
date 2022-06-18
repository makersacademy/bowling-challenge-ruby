require 'scorecard'
require 'roll'


RSpec.describe "integration" do
  it 'a user can input roll score' do
    scorecard = Scorecard.new()
    scorecard.input_score(Roll.new(10))
    expect(scorecard.current_roll).to eq 10
  end

end