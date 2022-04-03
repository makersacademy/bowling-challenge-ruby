require 'score_card'
require 'frame'

describe Scorecard do
  describe '#add_frame' do
    it 'allow a frame to be added' do
      frame = double('frame')
      subject.add_frame(frame)
      expect(subject.frames).to include(frame)
    end
  end

  describe '#calculate score' do
    it 'calculates score for a single frame' do
      frame1 = double('frame', :frame_score => 9)
      subject.add_frame(frame1)
      expect(subject.calculate_score).to eq 9
    end

    it 'calculates score for a two frames' do
      frame1 = double('frame', :frame_score => 7, :spare? => false, :strike? => false)
      frame2 = double('frame', :frame_score => 6, :spare? => false, :strike? => false)
      subject.add_frame(frame1)
      subject.add_frame(frame2)
      expect(subject.calculate_score).to eq 13
    end

    it 'calculates score for five frames' do
      frame1 = double('frame', :frame_score => 3, :spare? => false, :strike? => false)
      frame2 = double('frame', :frame_score => 8, :spare? => false, :strike? => false)
      frame3 = double('frame', :frame_score => 0, :spare? => false, :strike? => false)
      frame4 = double('frame', :frame_score => 5, :spare? => false, :strike? => false)
      frame5 = double('frame', :frame_score => 9, :spare? => false, :strike? => false)
      subject.add_frame(frame1)
      subject.add_frame(frame2)
      subject.add_frame(frame3)
      subject.add_frame(frame4)
      subject.add_frame(frame5)
      expect(subject.calculate_score).to eq 25
    end

    it 'calculates score for multiple frames including strikes and spares' do
      frame1 = double('frame', :frame_score => 14)
      frame2 = double('frame', :frame_score => 8)
      frame3 = double('frame', :frame_score => 9)
      frame4 = double('frame', :frame_score => 16)
      frame5 = double('frame', :frame_score => 6)
      subject.add_frame(frame1)
      subject.add_frame(frame2)
      subject.add_frame(frame3)
      subject.add_frame(frame4)
      subject.add_frame(frame5)
      expect(subject.calculate_score).to eq 53
    end
  end
end

  
