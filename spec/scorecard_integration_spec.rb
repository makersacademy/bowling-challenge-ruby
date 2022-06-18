require 'scorecard'
require 'roll'


RSpec.describe "integration" do
  xit 'a user can input roll score' do
    scorecard = Scorecard.new()
    scorecard.input_score(Roll.new(10))
    expect(:current_roll).to eq 10
  end

end