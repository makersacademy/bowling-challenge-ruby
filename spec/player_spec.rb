require 'player'

describe Player do 

  describe '#record_score' do
    it 'allows player to record score' do
      player = Player.new()
      expect(player.record(3)).to include 3
    end
  end

end
