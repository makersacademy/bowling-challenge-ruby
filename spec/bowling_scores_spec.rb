require 'bowling_scores'

describe BowlingScores do 

  # describe '#record_score' do
  #   it 'allows player to record their result' do
  #     player = BowlingScores.new()
  #     expect(player.record(3)).to include 3
  #   end
  # end

  describe '#strike' do
    it 'takes into account bonus points when player records a strike' do
      player = BowlingScores.new()
      expect(player.record(1, "strike")).to eq "You got a strike!"
    end
  end

  describe '#spare' do
    it 'takes into account bonus points when player records a spare' do
      player = BowlingScores.new()
      expect(player.record(1, "spare")).to eq "You got a spare!"
    end
  end

end
