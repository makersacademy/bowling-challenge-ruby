# frozen_string_literal: true
require_relative '../../lib/bowling_scorecard'
require 'rspec'

describe 'BowlingScorecard' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'when condition' do
    it 'succeeds' do
      card = BowlingScorecard.new
      puts card.start_game
    end
  end
end


