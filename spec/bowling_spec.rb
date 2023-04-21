require 'bowling_repo'
require_relative 'spec_helper'


RSpec.describe Scorecard do
  context "basic game simulation" do
    it "adds scores and returns total score" do
      scorecard = Scorecard.new
      scorecard.add_score(1)
      scorecard.add_score(2)
      expect(scorecard.total_score).to eq(3)
    end
  end
end