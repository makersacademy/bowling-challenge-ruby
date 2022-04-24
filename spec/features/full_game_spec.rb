require_relative '../../lib/game'

describe 'A user completes a full game' do
  let (:game) { Game.new }

  xit 'scores 133 points after playing 10 frames' do
    game.frame.knocked_down_pins(1)
    game.frame.knocked_down_pins(4)

    game.frame.knocked_down_pins(4)
    game.frame.knocked_down_pins(5)

    game.frame.knocked_down_pins(6)
    game.frame.knocked_down_pins(4)

    game.frame.knocked_down_pins(5)
    game.frame.knocked_down_pins(5)
    expect(game.calculate_total_score).to eq 39
  end
end
