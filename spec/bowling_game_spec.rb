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

end