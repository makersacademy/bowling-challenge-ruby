# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  let(:scorecard) { Scorecard.new(4, 6) }

  it 'returns scores' do
    expect(scorecard.total_score).to eq 10
  end
end
