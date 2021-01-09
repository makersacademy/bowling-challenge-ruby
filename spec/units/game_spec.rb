require 'game'

describe Game do
  describe '.create' do
    it "should create an instance of a Game" do
      expect(Game.create).to be_a Game
    end
  end
end
