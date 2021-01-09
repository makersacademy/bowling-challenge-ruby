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
  end
end
