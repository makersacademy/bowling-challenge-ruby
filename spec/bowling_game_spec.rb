require_relative '../lib/bowling_game'

describe Bowlinggame do

  describe 'bowling game behavior' do
    it "can roll a gutter game" do 
      game = Bowlinggame.new
      20.times {game.roll 0}
      expect(subject.score).to eq 0
    end
    
    it "can roll a score of 1" do
      game = Bowlinggame.new
      20.times {game.roll 1}
      expect(game.score).to eq 20
    end
  end



  # then next a score
  # This will be a new instance of the class whichh will equal 0
  # Then, if test uis correct think about getting the score set up etc.



end