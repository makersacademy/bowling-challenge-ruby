require 'game'

describe Game do
  let(:game) { described_class.new }
  describe '#initialize' do
    it "has an entry for every possible roll of the 22" do
      expect(game.scorecard.count).to eq 22
    end
    it "has a frame count set to 1" do
      expect(game.frame_counter).to eq 1
    end
    it "has a roll counter that starts at 1" do
      expect(game.roll_counter).to eq 1
    end
    it "has a frame counter that starts at 1" do
      expect(game.frame_counter).to eq 1
    end
  end
  describe '#roll' do
    it "adds the score to the scorecard at place 'roll_counter - 1'" do
      expect { game.roll(5) }.to change{ game.scorecard.sum }.by 5
    end
    it "adds 1 to the roll_counter" do
      expect { game.roll(5) }.to change{ game.roll_counter }.by 1 
    end
    it "adds 1 count extra to the roll_counter first role of frame is 10" do
      expect { game.roll(10) }.to change{ game.roll_counter }.by 2
    end
    it "changes strike to true if first role of frame is 10" do
      game.roll(10)
      expect(game.strike).to eq true
    end
    it "adds the score of the frame to the frames_total if you hit a strike" do
      game.roll(10)
      expect(game.frames_total).to eq [10,0,0,0,0,0,0,0,0,0]
    end
    it "adds one to the frame count if you get a strike" do
      game.roll(10)
      expect(game.frame_counter).to eq 2
    end
    it "adds one to the frame counter every second go of frame" do
      game.roll(4)
      game.roll(5)
      expect(game.frame_counter).to eq 2
    end
    it "adds the score to the score card on second go of frame" do
      game.roll(3)
      expect { game.roll(5) }.to change{ game.scorecard.sum }.by 5
    end
    it "changes spare to true if 1st and second roll of frame equal 10" do
      game.roll(5)
      game.roll(5)
      expect(game.spare).to eq true
    end
    it "sets strike to false at the end of each frame" do
      game.roll(10)
      expect(game.strike).to be true
      game.roll(5)
      game.roll(5)
      expect(game.strike).to eq false
    end
    it "sets spare equal to false after the first go of the frame" do
      game.roll(4)
      game.roll(6)
      expect(game.spare).to eq true
      game.roll(7)
      expect(game.spare).to eq false
    end
  end
end