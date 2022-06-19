require 'game'
require 'frame'

RSpec.describe "integration of Game and Frame classes" do
  context "when two frames have been played" do
    it "returns a scorecard with the scores" do
    game = Game.new
    frame_1 = Frame.new
    frame_2 = Frame.new
    game.add(frame_1)
    game.add(frame_2)
    expect(game.score_card).to eq [frame_1, frame_2]
    end
  end

end