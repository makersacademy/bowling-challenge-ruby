require 'scorecard'

describe Scorecard do
  context 'upon initialization' do
    before(:each) do
      @current_game = described_class.new("Mabon")
    end
    it 'has a player name' do
      expect(@current_game.player_name).to eq "Mabon"
    end
  end
end