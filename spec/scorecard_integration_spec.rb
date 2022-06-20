require 'scorecard'
require 'frame'
require_relative './test_helpers.rb'


RSpec.describe "integration" do
  it 'a user can input roll score' do
    scorecard = Scorecard.new()
    scorecard.input_score(Frame.new(5, 3))
    expect(scorecard.frame_total).to eq 8
  end

  xit 'stores scorecard info in database if no roll is strike or spare' do
    scorecard = Scorecard.new()
    player_game()

    expect(scorecard.game_total).to eq 80
  end

end