require 'game'

describe Game do

  describe '#store scores' do
    it 'can start a game with nil points' do
      expect(subject.score).to be nil
    end
  end

end
