require "game"

RSpec.describe Game do
  context "initialized game" do
    it "has a total score of 0" do
      game = Game.new(frame_class_double)

      expect(game.frames.sum(&:score)).to eq 0
    end
  end

  context "contains 10 frames with a score of 1" do
    it "has a total score of 10" do
      game = Game.new(frame_class_double(1))
      expect(game.frames.sum(&:score)).to eq 10
    end
  end
end

def frame_class_double(score = 0)
  frame_dbl = double(:frame, score: score)

  frame_class_dbl = double(:frame_class)
  expect(frame_class_dbl).to receive(:new)
    .with(no_args)
    .and_return(frame_dbl)
    .exactly(10).times

  return frame_class_dbl
end
