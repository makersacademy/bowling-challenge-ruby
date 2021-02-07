require 'game'

describe Game do
  let (:player) { double Player }
  let (:score_array) {double [2, 3, 4]}
  let (:score) { double Score.new(input_scores: score_array) }
  subject {described_class.new(player: player, score: score)}

  it 'initializes a player and score' do
    expect(subject.player).to eq player
    expect(subject.score).to eq score
  end



end
