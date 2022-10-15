# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:test_frames) do
    [
      Frame.new([0, 0], [3, 3], [3, 3]), Frame.new([5, 3], [3, 3], [3, 3]), # normal frames
      Frame.new([5, 5], [3, 3], [3, 3]), Frame.new([5, 5]), # spares
      Frame.new([10, 0], [3, 3], [3, 3]), Frame.new([10, 0]), Frame.new([10, 0], [10, 0], [3, 3]) # strikes
    ]
  end

  describe '#bonus_type' do
    it 'returns the type of bonus the frame should receive' do
      values = %i[no_bonus no_bonus spare no_bonus strike no_bonus strike]
      values.each_with_index { |value, i| expect(test_frames[i].bonus_type).to eq value }
    end
  end

  describe '#score' do
    it 'returns the score value of the frame' do
      values = [0, 8, 13, 10, 16, 10, 23]
      values.each_with_index { |value, i| expect(test_frames[i].score).to eq value }
    end
  end
end
