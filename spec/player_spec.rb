require 'player'

RSpec.describe Player do
  context 'player rolls,' do
    it 'knocks down 4 pins' do
      player = Player.new('Lebowski')
      expect(player.roll(4)).to eq 4
    end

    it 'knocks down 8 pins' do 
      player = Player.new('Lebowski')
      expect(player.roll(8)).to eq 8
    end
  end

  context 'returns player final score' do
    it 'when Lebowski scores zero' do
      player = Player.new('Lebowski')
      expect(player.final_score).to eq 0
      expect(player.name).to eq 'Lebowski'
    end
  end
end