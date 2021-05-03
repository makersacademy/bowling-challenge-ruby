require 'score_recorder'

describe ScoreRecorder do
  subject(:score_recorder) { described_class.new }
  let(:nine_frames) do
    nine_frames = []
    9.times { nine_frames << [0, 0] }
    nine_frames
  end

  describe '#add_roll' do
    it 'adds first roll' do
      score_recorder.add_roll(1)
      expected_frames = [[1]]
      expect(score_recorder.frames).to eq(expected_frames)
    end

    it 'adds second roll' do
      frames = [[1]]
      score_recorder.test_setup(frames)
      score_recorder.add_roll(2)
      expected_frames = [[1, 2]]
      expect(score_recorder.frames).to eq(expected_frames)
    end

    it 'adds second roll after strike' do
      frames = [[10]]
      score_recorder.test_setup(frames)
      score_recorder.add_roll(3)
      expected_frames = [[10], [3]]
      expect(score_recorder.frames).to eq(expected_frames)
    end

    it 'adds extra roll after strike 1st roll on tenth frame and additional roll' do
      frames = nine_frames << [10, 1]
      score_recorder.test_setup(frames)
      score_recorder.add_roll(4)
      expected_frames = nine_frames << [[10, 1, 4]]
      expect(score_recorder.frames).to eq(expected_frames)
    end

    it 'adds extra roll after spare on tenth frame' do
      frames = nine_frames << [5, 5]
      score_recorder.test_setup(frames)
      score_recorder.add_roll(5)
      expected_frames = nine_frames << [[5, 5, 5]]
      expect(score_recorder.frames).to eq(expected_frames)
    end
  end

  describe '#next_input_row' do
    context 'when less than 10 frames played' do
      it 'returns 1 for new game' do
        frames = []
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(1)
      end

      it 'returns 2 after first (non_strike) roll' do
        frames = [[3]]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(2)
      end

      it 'returns 1 after two (non_strike) rolls' do
        frames = [[6, 4]]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(1)
      end

      it 'returns 2 after three (non_strike) rolls' do
        frames = [[2, 3], [9]]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(2)
      end

      it 'returns 1 after strike' do
        frames = [[10]]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(1)
      end
    end

    context 'when 10 frames played' do
      it 'returns 2 after after first (non_strike) roll' do
        frames = nine_frames << [8]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(2)
      end

      it 'returns nil after full game (no spare/strikes' do
        frames = nine_frames << [2, 2]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(nil)
      end

      it 'returns 2 after strike first roll' do
        frames = nine_frames << [10]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(2)
      end

      it 'returns 3 after strike first roll and additional roll' do
        frames = nine_frames << [10, 0]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(3)
      end

      it 'returns 3 after spare' do
        frames = nine_frames << [5, 5]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(3)
      end

      it 'returns nil after extra roll played' do
        frames = nine_frames << [0, 10, 3]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_roll).to eq(nil)
      end
    end
  end

  describe '#next_input_frame' do
    context 'when less than 10 frames played' do
      it 'returns 1 for new game' do
        frames = []
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_frame).to eq(1)
      end

      it 'returns 1 after one (non-strike) roll' do
        frames = [[9]]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_frame).to eq(1)
      end

      it 'returns 2 after two (non-strike) rolls' do
        frames = [[3, 4]]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_frame).to eq(2)
      end

      it 'returns 2 after 1 strike roll' do
        frames = [[10]]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_frame).to eq(2)
      end
    end

    context 'when 10 frames played' do
      it 'returns 10 after strike first roll and additional roll' do
        frames = nine_frames << [10, 0]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_frame).to eq(10)
      end

      it 'returns 10 after spare' do
        frames = nine_frames << [5, 5]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_frame).to eq(10)
      end

      it 'returns nil after second roll (not strike or spare) taken' do
        frames = nine_frames << [1, 2]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_frame).to eq(nil)
      end

      it 'returns nil after extra roll taken' do
        frames = nine_frames << [10, 10, 10]
        score_recorder.test_setup(frames)
        expect(score_recorder.next_input_frame).to eq(nil)
      end
    end
  end
end
