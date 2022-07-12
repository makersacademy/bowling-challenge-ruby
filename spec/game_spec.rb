require 'game'

describe Game do
  let(:score) { double 'score', calculate: 'calculating', update_if_needed: 'checking updates', total: 'total' }
  subject { Game.new(score) }
  describe 'add' do
    it 'adds pins knocked down' do
      expect { subject.add(3) }.to change { subject.throws.size }.by(1)
    end
  end

  describe '#frame_complete?' do
    it 'returns true if total frame is less than 10' do
      subject.add(3)
      subject.add(4)
      expect(subject.frame_complete?).to be true
    end

    it 'returns false if not yet complete' do
      subject.add(3)
      expect(subject.frame_complete?).to be false
    end

    it 'returns true if first roll is 10' do
      subject.add(10)
      expect(subject.frame_complete?).to be true
    end
  end

  describe '#new_frame' do
    it 'empties the throws array' do
      subject.add(3)
      expect { subject.add(4) }.to change { subject.throws }.to []
    end

    it 'increases frame count by 1' do
      expect { subject.new_frame }.to change { subject.frame_count }.by(1)
    end
  end

  describe '#frame_status' do
    it 'sets frame complete to true after a strike' do
      subject.frame_status(10)
      expect(subject.frame_complete?).to be true
    end
  end

  describe '#setup_next_roll' do
    it 'calculates score if the frame is finished' do
      expect(score).to receive(:calculate)
      subject.add(10)
    end

    it 'calls for a new frame if frame complete' do
      expect(subject).to receive(:new_frame)
      subject.add(10)
    end
  end

  describe '#last_frame?' do
    it 'returns true if frame count is 10' do
      (Game::MAX_FRAME * 2 - 2).times { subject.add(3) }
      expect(subject.last_frame?).to be true
    end
  end

  describe '#play_last_frame' do
    it 'adds pins to final frame' do
      expect { subject.play_last_frame(5) }.to change { subject.last_frame.size }.by(1)
    end
  end

  describe '#last_frame_complete?' do
    it 'returns true if final frame is size 2 and less than 10' do
      allow(score).to receive(:calculate_last_frame)
      (Game::MAX_FRAME - 1).times { subject.add(10) }
      2.times { subject.add(3) }
      expect(subject.last_frame_complete?).to be true
    end
  end

  describe '#finished' do
    it 'calls calculate on score' do
      expect(score).to receive(:calculate_last_frame)
      subject.finished
    end

    it 'calls for total score' do
      allow(score).to receive(:calculate_last_frame)
      expect(score).to receive(:total)
      subject.finished
    end
  end

  describe '#scores' do
    it 'calls for scores from score' do
      expect(score).to receive(:scores)
      subject.scores
    end
  end
end