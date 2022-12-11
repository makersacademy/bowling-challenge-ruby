require "game"

RSpec.describe "Game Integration" do
  context "initialzed game" do
    it "shows a total score of 0" do
      game = Game.new
      expect(game.frames.sum(&:score)).to eq 0
    end
  end

  context "after 3 rolls added" do
    it "has correct total score, and the first frame is complete" do
      game = Game.new
      3.times { game.add_roll(4) }

      frames = game.frames
      expect(frames[0].score).to eq 8
      expect(frames[0].status).to eq :done
      expect(frames[1].score).to eq 4
      expect(frames[1].status).to eq :active
      expect(frames[1].rolls).to eq [4]

      expect(game.complete?).to be false
      expect(frames[2...10].all? { |frame| frame.status == :active }).to be true
      
      expect(frames.sum(&:score)).to eq 12
    end
  end

  # NOTE STRIKE BONUSES HAVE NOT BEEN IMPLEMENTED YET
  context "after 4 rolls, a strike, and remaining gutters" do
    it "has a total score of 26" do
      game = Game.new
      4.times { game.add_roll(4) }
      game.add_roll(10)
      14.times { game.add_roll(0) }

      expect(game.complete?).to be true
      expect(game.frames[2].status).to eq :strike
      expect(game.frames.sum(&:score)).to eq 26
    end
  end

  # NOTE SPARE BONUSES HAVE NOT BEEN IMPLEMENTED YET
  context "after 4 rolls, a spare, and remaining gutters" do
    it "has a total score of 26" do
      game = Game.new
      4.times { game.add_roll(4) }
      game.add_roll(7)
      game.add_roll(3)
      14.times { game.add_roll(0) }

      expect(game.complete?).to be true
      expect(game.frames[2].status).to eq :spare
      expect(game.frames.sum(&:score)).to eq 26
    end
  end

  context "gutter game" do
    it "has a total_score of 0, with all frames completed" do
      game = Game.new
      20.times { game.add_roll(0) }

      expect(game.complete?).to be true
      expect(game.frames.sum(&:score)).to eq 0
    end
  end

  context "game of all 4s" do
    it "has a total score of 80" do
      game = Game.new
      20.times { game.add_roll(4) }

      expect(game.complete?).to be true
      expect(game.frames.sum(&:score)).to eq 80
    end
  end

  context "9 frames of strikes and a [1,2] frame" do
    it "has a final score of 247" do
      game = Game.new
      9.times { game.add_roll(10) }
      game.add_roll(1)
      game.add_roll(2)

      expect(game.complete?).to be true
      expect(game.frames[0...7].sum(&:score)).to eq 210
      expect(game.frames[0...8].sum(&:score)).to eq 231
      expect(game.frames[0...9].sum(&:score)).to eq 244
      expect(game.frames[0...10].sum(&:score)).to eq 247
    end
  end

  context "9 frames of [5,5] spares and a [2,2] frame" do
    it "has a final score of 134" do
      game = Game.new
      18.times { game.add_roll(5) }
      game.add_roll(1)
      game.add_roll(2)

      expect(game.complete?).to be true
      expect(game.frames[0...7].sum(&:score)).to eq 105
      expect(game.frames[0...8].sum(&:score)).to eq 120
      expect(game.frames[0...9].sum(&:score)).to eq 131
      expect(game.frames[0...10].sum(&:score)).to eq 134
    end
  end
  context "a strike, a [5,5] spare and a [3,1] frame" do
    it "has a final score of 37" do
      game = Game.new
      game.add_roll(10)
      2.times { game.add_roll(5) }
      game.add_roll(3)
      game.add_roll(1)
      14.times { game.add_roll(0) }

      expect(game.complete?).to be true
      expect(game.frames[0].score).to eq 20
      expect(game.frames[1].score).to eq 13
      expect(game.frames[0...10].sum(&:score)).to eq 37
    end
  end
end
