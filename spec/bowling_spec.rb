require 'bowling'

describe Bowling do
  let(:scorer) { double 'scorer', calculate: 'calculating', update_if_needed: 'checking updates', total: 'total' }
  subject { Bowling.new(scorer) }
  describe 'add' do
    it 'adds pins knocked down to list of rolls' do
      expect { subject.add(3) }.to change { subject.throws.size }.by(1)
    end

    it 'calls on frame_status' do
      expect(subject).to receive(:frame_status)
      subject.add(3)
    end

    it 'calls calculate on scorer' do
      expect(scorer).to receive(:calculate)
      subject.add(10)
    end

    it 'calls new_frame' do
      expect(subject).to receive(:new_frame)
      subject.add(10)
    end

    it 'calls update if needed on scorer' do
      expect(scorer).to receive(:update_if_needed)
      subject.add(3)
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
    it 'clears the throws array' do
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
    it 'calls calculate on scorer if frame is complete' do
      expect(scorer).to receive(:calculate)
      subject.add(10)
    end

    it 'calls for new_frame if frame complete' do
      expect(subject).to receive(:new_frame)
      subject.add(10)
    end

    it 'calls update_if_needed on scorer if frame not yet complete' do
      expect(scorer).to receive(:update_if_needed)
      subject.add(3)
    end
  end

  describe '#final_frame?' do
    it 'returns true if frame count is 10' do
      (Bowling::FRAME_LIMIT * 2 - 2).times { subject.add(3) }
      expect(subject.final_frame?).to be true
    end
  end

  describe '#play_final_frame' do
    it 'adds pins to final frame array' do
      expect { subject.play_final_frame(5) }.to change { subject.final_frame.size }.by(1)
    end
  end

  describe '#final_frame_complete?' do
    it 'returns true if final frame is size 2 and less than 10' do
      allow(scorer).to receive(:calculate_final_frame)
      (Bowling::FRAME_LIMIT - 1).times { subject.add(10) }
      2.times { subject.add(3) }
      expect(subject.final_frame_complete?).to be true
    end
  end

  describe '#gameover' do
    it 'calls calculate on scorer' do
      expect(scorer).to receive(:calculate_final_frame)
      subject.gameover
    end

    it 'calls for total score' do
      allow(scorer).to receive(:calculate_final_frame)
      expect(scorer).to receive(:total)
      subject.gameover
    end
  end

  describe '#scores' do
    it 'calls for scores from scorer' do
      expect(scorer).to receive(:scores)
      subject.scores
    end
  end
end
