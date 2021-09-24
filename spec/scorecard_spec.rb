require 'scorecard'

describe Scorecard do
  context 'upon initialization' do
    before(:each) do
      @current_game = described_class.new("Mabon")
    end

    it 'has a player name' do
      expect(@current_game.player_name).to eq "Mabon"
    end

    it 'has a starting score of 0' do
      expect(@current_game.current_score).to eq 0
    end

    it 'starts at the first frame' do
      expect(@current_game.current_frame).to eq 1
    end
  end
end
