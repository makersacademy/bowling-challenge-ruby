require 'game'

RSpec.describe Game do
  context "frame contents" do
    it "no strikes" do
      frames = 10.times.map { [3, 4] }.flatten
      game = Game.new(frames.flatten)
      expect(game.frames[0].score).to eq(7)
      expect(game.next_two(2)).to eq(4)
    end

    it "with strikes" do
      frames = 10.times.map { [3, 4] }
      frames[1] = [10]
      frames[2] = [10]
      game = Game.new(frames.flatten)
      expect(game.frames[0].strike).to eq(false)
      expect(game.frames[1].strike).to eq(true)
      expect(game.next_roll(1)).to eq(10)
      expect(game.next_roll(3)).to eq(3)
      expect(game.next_two(1)).to eq(10)
    end

    it "10th frame with a spare and extra ball" do
      frames = 9.times.map { [3, 4] }
      frames << [4, 6, 5]
      game = Game.new(frames.flatten)
      expect(game.frames[9].strike).to eq(false)
      expect(game.frames[9].spare_or_strike).to eq(true)
      expect(game.next_roll(9)).to eq(4)
    end
   
    it "10th frame with a strike and 2 extra balls" do
      frames = 9.times.map { [3, 4] }
      frames << [10, 9, 10]
      game = Game.new(frames.flatten)
      expect(game.frames[9].strike).to eq(true)
      expect(game.frames[9].spare_or_strike).to eq(false)
      expect(game.next_two(9)).to eq(9)
    end
  end
end