# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  let(:score133) { [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] }
  let(:score300) { [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10] }
  let(:score0) { [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] }
  let(:game133) { Scorecard.new(score133) }
  let(:game300) { Scorecard.new(score300) }
  let(:game0) { Scorecard.new(score0) }
  let(:game_default) { Scorecard.new }

  it 'sets @bowls to the passed argument value when initialized' do
    expect(game133.bowls).to eq score133
    expect(game300.bowls).to eq score300
    expect(game0.bowls).to eq score0
  end

  it 'sets @bowls to the default value if initialized with no arguments passed ' do
    expect(game_default.bowls).to eq Scorecard::DEFAULT_BOWLS
  end
end
