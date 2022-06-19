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

  it "knows the current frame number" do
    game = Game.new
    frame_1 = Frame.new
    frame_2 = Frame.new
    game.add(frame_1)
    game.add(frame_2)
    expect(game.current_frame).to eq 3
  end

  xit "gets the total from a number of rolls" do
    game = Game.new
    frame_1 = Frame.new
    frame_2 = Frame.new
    frame_1.roll(2)
    frame_1.roll(3)
    game.add(frame_1)
    frame_2.roll(4)
    frame_2.roll(5)
    game.add(frame_2)
    expect(frame_1.closed?).to eq true
    expect(game.sum_total).to eq 14
  end

  xit "returns the score of the next frame to frame_2" do
    game = Game.new
    frame_1 = Frame.new
    frame_2 = Frame.new
    frame_3 = Frame.new
    frame_1.roll(2)
    frame_1.roll(3)
    frame_2.roll(10)
    frame_3.roll(4)
    frame_3.roll(1)
    game.add(frame_1)
    game.add(frame_2)
    game.add(frame_3)
    expect(game.next_frame_score).to eq 5
    expect(game.current_frame).to eq 4
  end
  

end