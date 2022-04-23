require 'game'

describe Game do
  describe '#run_game' do
    it 'let user to input their score' do
      game = Game.new
      input = game.user_input_scores
      expect(input.to_i).to be_between(0,10) 
    end
  end
end