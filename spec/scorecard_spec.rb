# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  it 'returns scores' do
    # game = double(Game.new)
    # 11.times { allow(game).to receive(:gets).and_return('10') }
    # scorecard = game.play
    scorecard = Scorecard.new([{:frame_number=>1, :roll1=>10},
      {:frame_number=>2, :roll1=>10},
      {:frame_number=>3, :roll1=>10},
      {:frame_number=>4, :roll1=>10},
      {:frame_number=>5, :roll1=>10},
      {:frame_number=>6, :roll1=>10},
      {:frame_number=>7, :roll1=>10},
      {:frame_number=>8, :roll1=>10},
      {:frame_number=>9, :roll1=>10},
      {:frame_number=>10, :roll1=>10},
      {:frame_number=>:bonus_roll, :roll1=>10}])

    expect(scorecard.total_score).to eq 110
  end

  xdescribe '.frame_interpreter' do
    it 'interprets arrays' do
      expect(scorecard)
    end
  end
end
