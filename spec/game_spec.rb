require 'game'

describe Game do
  describe 'game has ten frames' do
      it 'has a total of ten frames as a constant' do
        expect(subject.number_of_frames).to eq Game::NO_OF_FRAMES
    end
  end
end