require 'bowling_game'

describe BowlingGame do
  before do
    @game = BowlingGame.new
  end

  it "creates a scorecard array on creation" do
    expect(@game.scorecard).to be_a Array
    expect(@game.scorecard.length).to eq 0
  end

  context ".add_rolls" do
    it "adds rolls to scorecard as valid frames" do
      @game.add_roll(5)
      @game.add_roll(3)
      @game.add_roll(10)
      @game.add_roll(3)
      @game.add_roll(2)
      expect(@game.scorecard.length).to eq 3
      expect(@game.scorecard[0]).to eq [5,3]
      expect(@game.scorecard[1]).to eq [10]
      expect(@game.scorecard[2]).to eq [3,2]
    end

    it "can't add more than 10 frames" do
      15.times { @game.add_roll(10) } 
      expect(@game.scorecard.length).to eq 10
    end

    it "final frame can have 3 rolls if strike rolled" do
      12.times { @game.add_roll(10) } 
      expect(@game.scorecard[9].length).to eq 3
      expect(@game.scorecard[9]).to eq([10,10,10])
    end
    
    it "final frame can have 3 rolls if spare rolled" do
      9.times { @game.add_roll(10) } 
      2.times { @game.add_roll(5) }
      @game.add_roll(4)
      expect(@game.scorecard[9].length).to eq 3
      expect(@game.scorecard[9]).to eq([5,5,4])
    end

  end

  context ".strike?" do
    it "returns true when strike" do
      expect(subject.strike?([10])).to eq true
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

  context ".score" do
    it "adds both values in frame if neither spare or strike" do
      @game.add_roll(5)
      @game.add_roll(4)
      expect(@game.score).to eq 9
    end

    it "if spare adds first value of next frame to score" do
      @game.add_roll(5)
      @game.add_roll(5)
      @game.add_roll(5)
      @game.add_roll(2)
      expect(@game.score).to eq 22
    end  

    it "if strike adds both values of next frame to score" do
      @game.add_roll(10)
      @game.add_roll(5)
      @game.add_roll(3)
      @game.add_roll(3)
      expect(@game.score).to eq 26 
    end  

    it "gutter game" do
      20.times { @game.add_roll(0)}
      expect(@game.score).to eq 0
    end

    it "perfect game" do
      12.times { @game.add_roll(10)}
      expect(@game.score).to eq 300
    end
  end
end
