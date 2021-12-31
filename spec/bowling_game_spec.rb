require 'bowling_game'

describe BowlingGame do

  it "stores a scorecard inside a 2d array" do
    game = BowlingGame.new([[5,4],[4,4],[3,2],[2,2]])
    expect(game.scorecard).to be_a Array
    expect(game.scorecard.length).to eq 4
    expect(game.scorecard[0]).to eq [5,4]
    expect(game.scorecard[-1]).to eq [2,2]
  end

  context ".score" do
    it "adds both values in frame if neither spare or strike" do
      game = BowlingGame.new([[5,4]])
      expect(game.score).to eq 9
    end

    it "if spare adds first value of next frame to score" do
      game = BowlingGame.new([[5,5],[5,3]])
      expect(game.score).to eq 23 #(10 from first + bonus 5 from next frame first roll)
    end  

    it "if strike adds both values of next frame to score" do
      game = BowlingGame.new([[10],[5,3]])
      expect(game.score).to eq 26 #(10 from first + bonus 8 from next frame both rolls)
    end  
  end

  context ".strike?" do
    it "returns true when strike" do
      expect(subject.strike?([10,0])).to eq true
    end

    it "returns false when not strike" do
      expect(subject.strike?([5,3])).to eq false
    end
  end

  context ".spare?" do
    it "returns true when a spare" do
      expect(subject.spare?([5,5])).to eq true
    end

    it "returns false when not spare" do
      expect(subject.spare?([5,3])).to eq false
    end
  end
end
