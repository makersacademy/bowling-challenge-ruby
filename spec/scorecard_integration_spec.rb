require 'scorecard'
require 'frame'


RSpec.describe "integration" do
  it 'a user can input roll score' do
    scorecard = Scorecard.new()
    scorecard.input_score(Frame.new(5, 3))
    expect(scorecard.frame_total).to eq 8
  end

end