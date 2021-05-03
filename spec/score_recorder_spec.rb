require 'score_recorder'

describe ScoreRecorder do
  subject(:scorerecorder) { described_class.new }

  describe '#next_input_row' do
    context 'when less than 10 frames played' do
      it 'returns 1 for new game' do
        frames = []
        expect(scorerecorder.next_input_roll(frames)).to eq(1)
      end

      it 'returns 2 after first (non_strike) roll' do
        frames = [[3]]
        expect(scorerecorder.next_input_roll(frames)).to eq(2)
      end

      it 'returns 1 after two (non_strike) rolls' do
        frames = [[6, 4]]
        expect(scorerecorder.next_input_roll(frames)).to eq(1)
      end

      it 'returns 2 after three (non_strike) rolls' do
        frames = [[2, 3], [9]]
        expect(scorerecorder.next_input_roll(frames)).to eq(2)
      end

      it 'returns 1 after strike' do
        frames = [[10]]
        expect(scorerecorder.next_input_roll(frames)).to eq(1)
      end
    end

    context 'when 10 frames played' do
      let(:nine_frames) do
        nine_frames = []
        9.times { nine_frames << [0, 0] }
        nine_frames
      end

      it 'returns 2 after after first (non_strike) roll in 10th frame)' do
        frames = nine_frames << [8]
        expect(scorerecorder.next_input_roll(frames)).to eq(2)
      end

      it 'returns nil after full game (no spare/strikes in 10th frame)' do
        frames = nine_frames << [2, 2]
        expect(scorerecorder.next_input_roll(frames)).to eq(nil)
      end

      it 'returns 2 after strike first roll in 10th frame' do
        frames = nine_frames << [10]
        expect(scorerecorder.next_input_roll(frames)).to eq(2)
      end

      xit 'returns 3 after  strike first roll in 10th frame' do
        frames = nine_frames << [10, 0]
        expect(scorerecorder.next_input_roll(frames)).to eq(3)
      end
    end
  end

  describe '#next_input_frame' do
    context 'when less than 10 frames played' do
      it 'returns 1 for new game' do
        frames = []
        expect(scorerecorder.next_input_frame(frames)).to eq(1)
      end

      it 'returns 1 after one (non-strike) roll' do
        frames = [[9]]
        expect(scorerecorder.next_input_frame(frames)).to eq(1)
      end

      it 'returns 2 after two (non-strike) rolls' do
        frames = [[3, 4]]
        expect(scorerecorder.next_input_frame(frames)).to eq(2)
      end

      it 'returns 2 after 1 strike roll' do
        frames = [[10]]
        expect(scorerecorder.next_input_frame(frames)).to eq(2)
      end
    end
  end
end
