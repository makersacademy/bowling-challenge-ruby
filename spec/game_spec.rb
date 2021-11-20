require 'game'

describe Game do
  describe 'game has ten frames' do
      it 'has a total of ten frames as a constant' do
        expect(subject.number_of_frames).to eq Game::NO_OF_FRAMES
    end
  end
end




# As a player
# So I can complete a game of bowling
# I want my game to have 10 frames    