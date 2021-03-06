require 'game' 

describe Game do

  describe '.create' do
    it 'creates a game' do
      expect(Game.create).to be_a(Game)
    end

    it '0 rolls have been played' do
      expect(subject.turn).to eq(0)
    end
  end



end