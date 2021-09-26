require 'game'

describe Game do
  it 'should provide the total score of a frame correctly' do 
   game = Game.new(:roll_one, :roll_two)
   allow(game).to receive(:roll_one) { 3 }
   allow(game).to receive(:roll_two) { 6 }
   expect(game.total_of_frame).to eq (9)
  end 
end 
