require 'game'

describe Game do
  describe ".create" do
    context "In order order score a bowling Game" do
      it "I would like to create a Game" do
        expect(Game.create).to be_a Game
      end
    end
  end
end
