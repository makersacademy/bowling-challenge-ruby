require 'game'

describe Game do
  subject(:game) { described_class.new }
  describe 'input scores' do
    it 'should allow user to input their scores' do
      expect(game.input(5)).to eq 5
    end
  end
end