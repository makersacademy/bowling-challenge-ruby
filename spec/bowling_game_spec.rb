require_relative '../lib/bowling_game'

describe Bowlinggame do

  describe 'bowling game behavior' do
    it "can roll a gutter game" do 
      game = Bowlinggame.new
      game.pins 0
      expect(subject.score).to eq 0
    end

  end


  # And then one for a gutter game
  # then next a score
  # This will be a new instance of the class whichh will equal 0
  # Then, if test uis correct think about getting the score set up etc.



end