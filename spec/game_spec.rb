require 'game' 

describe Game do

  describe '.create' do
    it 'creates a game' do
      expect(Game.create).to be_a(Game)
    end
  end

end