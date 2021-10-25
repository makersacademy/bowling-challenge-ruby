require './game'

describe Game do
  describe ".roll" do
    it "should put the number of pins from each roll in successive frames" do
      game = Game.new

      game.roll(5)
      game.roll(3)
      game.roll(10)
      game.roll(2)
      game.roll(0)

      expect(game.frames[0]).to include 5
      expect(game.frames[0]).to include 3
      expect(game.frames[1]).to include 10
      expect(game.frames[2]).to include 2
      expect(game.frames[2]).to include 0
    end

      xit "should put the last 3 rolls in the tenth frame" do
        game = Game.new
        
        game.roll(5)
        game.roll(3)
        game.roll(10)

        expect(game.frames[9]).to include 5
        expect(game.frames[9]).to include 3
        expect(game.frames[9]).to include 10
    end
  end
end
