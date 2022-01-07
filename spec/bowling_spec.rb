require 'bowling'

describe BowlingGame do

  before do
    @game = BowlingGame.new
  end
 
  it "can play a game of gutter balls" do
    20.times {
      @game.rolls 0
    }
    expect(@game.score).to eq 0
  end

  it "can roll all ones" do
    20.times {
      @game.rolls 1
    }
    expect(@game.score).to eq 20
  end

  it "can roll a spare" do

    @game.rolls 5
    @game.rolls 5
    @game.rolls 3
    17.times {
      @game.rolls 0
    }
    expect(@game.score).to eq 16
  end

  it "can roll a strike" do

    @game.rolls 10
    @game.rolls 3
    @game.rolls 5
    16.times {
        @game.rolls 0
    }
    expect(@game.score).to eq 26
  end

  it "can roll a perfect game" do
      12.times {
        @game.rolls 10
      }
      expect(@game.score).to eq 300
  end
end