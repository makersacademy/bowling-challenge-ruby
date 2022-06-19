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

  context "given a set of frame scores" do
    it "returns the total" do
    game = Game.new
    frame_1 = Frame.new
    frame_2 = Frame.new
    frame_1 = 7
    frame_2 = 8
    game.add(frame_1)
    game.add(frame_2)
    expect(game.sum_total).to eq 15
    end
  end

end