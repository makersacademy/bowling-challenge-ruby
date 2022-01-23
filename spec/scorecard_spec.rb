# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  let(:scorecard) { Scorecard.new(4, 4, last_frame: 2) }

  it 'returns scores' do
    expect(scorecard.total_score).to eq 10
  end

  xdescribe '.frame_interpreter' do
    it 'interprets arrays' do
      expect(scorecard)
    end
  end
end
