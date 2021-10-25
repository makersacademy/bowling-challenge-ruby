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
  end
end

# DO NOT TEST STATE - The only behaviour of the code is that it caclulate the correct score. That's what needs teting.
#  Write one test that test that different inputs caclulate the correct score.
#  Following TDD would mean that the first test is taking one roll and the score is that roll's pins.
#  Then add one roll and the score will be the sum of the two rolls' pins... etc
