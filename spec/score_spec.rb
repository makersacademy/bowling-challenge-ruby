require_relative '../lib/score'
require_relative '../lib/game'

describe Score do
  let(:score) { described_class.new }

  context '#calculate_total_score' do
    it 'provides user with total score' do
      game = Game.new
      game.frame.knocked_down_pins(5)
      expect(score.calculate_total_score(game.frame.knocked_down_pins_log)).to eq 5
    end
  end
end