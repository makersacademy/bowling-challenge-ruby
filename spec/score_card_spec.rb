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

  describe '#calculate_current_score' do
  
    it 'should know score is 0 at start of the game' do
      expect(subject.calculate_current_score).to eq 0
    end

    it 'should calculate score for one frame' do
      frame1 = double('frame', :roll_1 => 4, :roll_2 => 5, :roll_3 => nil, :tenth_frame => false)
      subject.add_frame(frame1)
      expect(subject.calculate_current_score).to eq 9
    end

    it 'should calculate score for multiple frames' do
      frame1 = double('frame', :roll_1 => 4, :roll_2 => 5, :roll_3 => nil, :spare? => false, :strike? => false, :tenth_frame => false)
      frame2 = double('frame', :roll_1 => 1, :roll_2 => 1, :roll_3 => nil, :spare? => false, :strike? => false, :tenth_frame => false)
      frame3 = double('frame', :roll_1 => 8, :roll_2 => 0, :roll_3 => nil, :spare? => false, :strike? => false, :tenth_frame => false)
      subject.add_frame(frame1)
      subject.add_frame(frame2)
      subject.add_frame(frame3)
      
      expect(subject.calculate_current_score).to eq 19
    end

    it 'should calculate score when there was a spare' do
      frame1 = double('frame', :roll_1 => 4, :roll_2 => 6, :roll_3 => nil, :spare? => true, :strike? => false, :tenth_frame => false)
      frame2 = double('frame', :roll_1 => 3, :roll_2 => 6, :roll_3 => nil, :spare? => false, :strike? => false, :tenth_frame => false)
      subject.add_frame(frame1)
      subject.add_frame(frame2)
      
      expect(subject.calculate_current_score).to eq 22
    end

    it 'should calculate score when there was a strike' do
      frame1 = double('frame', :roll_1 => 10, :roll_2 => nil, :roll_3 => nil, :spare? => false, :strike? => true, :tenth_frame => false)
      frame2 = double('frame', :roll_1 => 3, :roll_2 => 6, :roll_3 => nil, :spare? => false, :strike? => false, :tenth_frame => false)
      subject.add_frame(frame1)
      subject.add_frame(frame2)
      
      expect(subject.calculate_current_score).to eq 28
    end
  end

end

  
