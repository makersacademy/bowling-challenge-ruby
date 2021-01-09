require 'game'

describe Game do
  describe '.create' do
    it "should create an instance of a Game" do
      expect(Game.create).to be_a Game
    end
  end

  describe '.score' do
    it "should receive with one argument" do
      expect(Game).to respond_to(:score).with(1).argument
    end

    it "should receive [0] and return [0,0,0,0,0,0,0,0,0,0]" do
      result = Game.score([0])
      expect(result).to eq [0,0,0,0,0,0,0,0,0,0]
    end

    it "should receive [0,0] and return [0,0,0,0,0,0,0,0,0,0]" do
      result = Game.score([0,0])
      expect(result).to eq [0,0,0,0,0,0,0,0,0,0]
    end
  end
end
