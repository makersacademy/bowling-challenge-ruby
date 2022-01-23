# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  let(:perfect_game) { Scorecard.new([{ :frame_number=>1, :roll1=>10 },
    { :frame_number=>2, :roll1=>10 },
    { :frame_number=>3, :roll1=>10 },
    { :frame_number=>4, :roll1=>10 },
    { :frame_number=>5, :roll1=>10 },
    { :frame_number=>6, :roll1=>10 },
    { :frame_number=>7, :roll1=>10 },
    { :frame_number=>8, :roll1=>10 },
    { :frame_number=>9, :roll1=>10 },
    { :frame_number=>10, :roll1=>10 },
    { :frame_number=>:bonus_roll, :roll1=>10 }]) }

    let(:gutter_game) { Scorecard.new([{ :frame_number=>1, :roll1=>0 },
      { :frame_number=>2, :roll1=>0 },
      { :frame_number=>3, :roll1=>0 },
      { :frame_number=>4, :roll1=>0 },
      { :frame_number=>5, :roll1=>0 },
      { :frame_number=>6, :roll1=>0 },
      { :frame_number=>7, :roll1=>0 },
      { :frame_number=>8, :roll1=>0 },
      { :frame_number=>9, :roll1=>0 },
      { :frame_number=>10, :roll1=>0 }]) }

    let(:mixed_game) { Scorecard.new([{ :frame_number=>1, :roll1=>6, :roll2=>3 },
      { :frame_number=>2, :roll1=>3, :roll2=>7 },
      { :frame_number=>3, :roll1=>5, :roll2=>4 },
      { :frame_number=>4, :roll1=>6, :roll2=>0 },
      { :frame_number=>5, :roll1=>10 },
      { :frame_number=>6, :roll1=>6, :roll2=>3 },
      { :frame_number=>7, :roll1=>4, :roll2=>3 },
      { :frame_number=>8, :roll1=>2, :roll2=>1 },
      { :frame_number=>9, :roll1=>4, :roll2=>4 },
      { :frame_number=>10, :roll1=>5, :roll2=>5 },
      { :frame_number=>:bonus_roll, :roll1=>3 }]) }    
  
    it 'returns scores' do
    # game = double(Game.new)
    # 11.times { allow(game).to receive(:gets).and_return('10') }
    # scorecard = game.play

    expect(perfect_game.total_score).to eq 300
    expect(gutter_game.total_score).to eq 0
    expect(mixed_game.total_score).to eq 98
  end

  xdescribe '.frame_interpreter' do
    it 'interprets arrays' do
      expect(scorecard)
    end
  end
end
