require 'game'

describe Game do
  let(:game) {Game.new}
  describe '#run_game' do
    let(:user_input) { 5 }
    it 'let user to input their score' do
      input = game.user_input_scores(user_input)
      expect(input).to eq 5
    end
  end  

  describe '#run_game-error' do
    let(:user_input) { 15 }  
    it 'raise an error is user enters' do 
      expect { game.user_input_scores(user_input) }.to raise_error 'Score need to between 0 and 10'
    end
  end

  describe '#frame_manager' do
    it 'counts number of frames' do
      game.frame_manager
      expect(game.counter_frame).to be_between(1,10)
    end
  end
end
