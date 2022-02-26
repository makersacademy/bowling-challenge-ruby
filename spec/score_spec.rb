require 'score'

describe Score do
  let(:score) { described_class.new }
  let(:frame) { double :frame }

  describe '#record_roll' do
    it 'passes the score of a single roll to the current frame' do
      allow(Frame).to receive(:new).and_return(frame)
      expect(frame).to receive(:record_roll)
      expect(frame).to receive(:rolls)
      expect(frame).to receive(:strike?)
      expect(frame).to receive(:contents)
      score.record_roll(5)
    end
  end

  describe '#apply_bonuses' do
    it 'correctly applies bonus after a spare' do
      expect(score.apply_bonuses([[4, 6], [7, 2]])).to eq([[4, 13], [7, 2]])
    end
    it 'correctly applies bonus after a strike' do
      expect(score.apply_bonuses([[10], [8, 3], [2, 1]])).to eq([[21], [8, 3], [2, 1]])
    end
    it 'correctly applies bonus after multiple strikes' do
      expect(score.apply_bonuses([[10], [10], [10]])).to eq([[30], [10], [10]])
    end
  end

  describe '#check_current_frame' do
    it 'empties @current_frame into @completed_frames if it contains two rolls' do
      allow(Frame).to receive(:new).and_return(frame)
      allow(frame).to receive(:rolls).and_return(2)
      allow(frame).to receive(:contents).and_return([2, 7])
      score.check_current_frame
      expect(score.completed_frames).to eq([[2, 7]])
    end
    it 'empties @current_frame into @completed_frames if it contains a strike' do
      allow(score).to receive(:current_frame).and_return(frame)
      allow(frame).to receive(:strike?).and_return(true)

      expect(score.check_current_frame).to eq([])
    end
  end
end