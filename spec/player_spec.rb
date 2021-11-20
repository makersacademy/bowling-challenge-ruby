require 'player'

describe Player do
  let(:roll_score) { Player.roll_score(10)}
  describe '.roll' do
    it 'allows player to enter the score of their previous roll' do
      expect(roll_score).to eq 10
    end
  end
end


# As a player
# So I can complete a frame
# I want to be able to knock down 10 pins in a roll