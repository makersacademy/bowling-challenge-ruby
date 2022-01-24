# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  let(:perfect_game) { Scorecard.new }
  let(:gutter_game) { Scorecard.new([[0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0]]) }
  let(:mixed_game) { Scorecard.new([[10], [3, 6], [5, 0], [3, 7], [6, 3], [10], [5, 3], [5, 2], [8, 0], [10], [10], [10]]) }   
  
  it 'returns scores' do
    expect(perfect_game.total_score).to eq 300
    expect(gutter_game.total_score).to eq 0
    expect(mixed_game.total_score).to eq 129
  end
end
