require 'game'

describe Game do
  describe '#run_game' do
    let(:user_input) { 5 }
    it 'let user to input their score' do
      game = Game.new
      input = game.user_input_scores(user_input)
      expect(input).to eq 5
    end
  end  

  describe '#run_game-error' do
     let(:user_input) { 15 }  
    it 'raise an error is user enters' do 
      game = Game.new
      expect{game.user_input_scores(user_input)}.to raise_error 'Score need to between 0 and 10'
    end
  end
end
