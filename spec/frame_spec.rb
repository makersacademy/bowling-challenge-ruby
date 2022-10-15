require 'frame'

RSpec.describe Frame do
  describe '#add_rolls' do
    it 'adds 2 rolls to rolls array' do
      frame = Frame.new('1', '6')
      frame.add_rolls
      expect(frame.frame_arr).to eq ['1', '6']
    end

    it 'adds a spare to rolls array' do
      frame = Frame.new('1', '/')
      frame.add_rolls
      expect(frame.frame_arr).to eq ['1', '/']
    end
  end

  describe '#sum_rolls' do
    it 'sums the rolls in frame_arr to return a raw score' do
      frame = Frame.new('1', '6')
      frame.add_rolls
      expect(frame.sum_rolls).to eq 7
    end

    it 'sums a spare in frame_arr ro returns a score of 10' do
      frame = Frame.new('1', '/')
      frame.add_rolls
      expect(frame.sum_rolls).to eq 10
    end
  end
end