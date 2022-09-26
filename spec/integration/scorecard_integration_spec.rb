require 'scorecard'

RSpec.describe Scorecard do

  let(:scorecard) { Scorecard.new(double(:io)) }

  describe '#initialize_with_frames' do
    it 'creates 10 frames in scorecard' do
      expect(scorecard.frames.length).to eq 10
    end
  end

  describe '#format_frame(frame)' do
    it 'formats unplayed frame' do
      frame = double(
        :frame, first_roll: nil, second_roll: nil, strike?: false, spare?: false)
      expect(scorecard.format_frame(frame)).to eq '| | | |'
    end
  
    it 'formats frame 4/5' do
      frame = double(
        :frame, first_roll: 4, second_roll: 5, strike?: false, spare?: false)
      expect(scorecard.format_frame(frame)).to eq '| |4|5|'
    end

    it 'formats frame 4/6 (spare)' do
      frame = double(
        :frame, first_roll: 4, second_roll: 6, strike?: false, spare?: true)
      expect(scorecard.format_frame(frame)).to eq '| |4|/|'
    end

    it 'formats frame 10/- (strike)' do
      frame = double(
        :frame, first_roll: 10, second_roll: nil, strike?: true, spare?: false)
      expect(scorecard.format_frame(frame)).to eq '| |X| |'
    end
  end

  context 'processes full game' do
    it 'returns score 133 for example game' do
      io = double(:io)
      scorecard = Scorecard.new(io)
      expect(io).to receive(:gets).and_return(
        '1', '4', '4', '5', '6', '4', '5', '5', '10', '0', '1', '7', '3', '6',
        '4', '10', '2', '8', '6')
      allow(io).to receive(:puts)
      allow(io).to receive(:print)
      scorecard.player_name = 'Loki'
      scorecard.game
      expect(scorecard.current_total).to eq 133
    end

    it 'returns score 300 for perfect game' do
      io = double(:io)
      scorecard = Scorecard.new(io)
      expect(io).to receive(:gets).and_return(
        '10', '10', '10', '10', '10', '10', '10', '10', '10', '10', '10', '10')
      allow(io).to receive(:puts)
      allow(io).to receive(:print)
      scorecard.player_name = 'Loki'
      scorecard.game
      expect(scorecard.current_total).to eq 300
    end
  end
end