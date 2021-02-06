require 'game'

describe Game do
  subject(:game) { described_class.play }

    describe '.play' do
      it "should allow game to respond to play" do
      expect(Game.play).to be_a(Game)
    end
  end

    describe '.bowl' do
      it "should allow the user to input the score" do
      expect(game).to respond_to(:bowl).with(1).argument
    end

    it "should return the total score" do
      game = Game.play
      game.bowl(7)
      game.bowl(2)

      expect(game.total_score).to eq(9)
    end
  end


end



# game.roll(7)
# game.roll(2)
# game.Score
# => 9
