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

  context "#add_roll" do
    it "calls Frame#add_roll" do
      frame_dbl = double(:frame, status: :active)
      expect(frame_dbl).to receive(:add_roll)

      game = Game.new(frame_class_double(0, frame_dbl))
      game.add_roll(5)
    end

    it "raises an error if too many rolls are inputted" do
      game = Game.new
      20.times { game.add_roll(0) }

      error_message = "You cannot add any more rolls"
      expect { game.add_roll(0) }.to raise_error error_message
    end
  end
end

def frame_class_double(score = 0, frame_dbl = double(:frame, status: :active, add_roll: nil))
  allow(frame_dbl).to receive(:score).and_return(score)

  frame_class_dbl = double(:frame_class)
  expect(frame_class_dbl).to receive(:new)
    .with(no_args)
    .and_return(frame_dbl)
    .exactly(10).times
  return frame_class_dbl
end
