# frozen_string_literal: true

describe 'What is the current frame' do
  it 'is the start of the game' do
    scorecard = ScoreCard.new
    expect(scorecard.current_frame_number).to eq 0
  end
end
