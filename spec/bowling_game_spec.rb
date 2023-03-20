require 'bowling_game'

RSpec.describe BowlingGame do
  
  before(:each) do
    @game = BowlingGame.new
  end

  it "constructs a game" do
    game = BowlingGame.new
  end

  context "when a player rolls all zeros" do
    it "scores a gutter game" do
      20.times do 
        @game.roll(0)
      end
      expect(@game.score).to eq 0
    end
  end

  context "when a player rolls all ones" do
    it "scores a game of 20" do
      20.times do
        @game.roll(1)
      end
      expect(@game.score).to eq 20
    end
  end

  context "when a player rolls a spare" do
    it "adds the score of the next roll on to the 10 from the spare" do
      @game.roll(5)
      @game.roll(5)
      @game.roll(5)
      @game.roll(3) 
      16.times do
        @game.roll(0)
      end
      expect(@game.score).to eq 23
    end
  end

  context "when a player rolls a strike" do
    it "adds the score of the next two rolls on to the 10 from the strike" do
      @game.roll(10)
      @game.roll(5)
      @game.roll(2)
      16.times do 
        @game.roll(0)
      end
      expect(@game.score).to eq 24 
    end
  end

end