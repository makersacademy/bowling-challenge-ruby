require 'game'
require 'stringio'

describe Game do
  let(:game) { Game.new }
  

  describe '#run_game' do
    before do
      $stdin = StringIO.new("3\n")
    end
    after do
      $stdin = STDIN
    end
    it 'let user to input their score' do
      expect(game.user_input_scores).to be == 3
    end
  end
 

  describe '#run_game-error' do
    before do
      $stdin = StringIO.new("15\n")
    end
    after do
      $stdin = STDIN
    end
    it 'raise an error is user enters' do 
      expect { game.user_input_scores }.to raise_error 'Score need to between 0 and 10'
    end
  end

  describe '#frame_manager' do
    it 'counts number of frames' do
      expect { game.counter_frame }.not_to raise_error
    end
  end
  
end
