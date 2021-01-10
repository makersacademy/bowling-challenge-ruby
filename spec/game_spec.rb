require 'game'

describe Game do
  it 'can be initialized' do
    expect(Game).to respond_to(:new)
  end

  it 'initializes with starting conditions' do
    expect(subject.current_turn).to eq 0
    expect(subject.game_score).to eq 0
    expect(subject.current_frame).to eq nil
    expect(subject.frames).to eq []
  end

  describe '#start_new_frame' do
    it 'begings the game and proceeds to first frame' do
      subject.start_new_frame
      expect(subject.current_turn).to eq 1
      expect(subject.current_frame).to be_kind_of Frame
    end
  end

  describe '#roll_current_frame' do
    it 'updates the current frame based on rolls' do
      subject.start_new_frame
      subject.roll_current_frame(5, 3)
      expect(subject.current_frame.throws).to eq [5, 3]
    end

    it 'will work for a strike also' do
      subject.start_new_frame
      subject.roll_current_frame(10)
      expect(subject.current_frame.throws).to eq [10]
    end

    it 'can call on add_roll_score' do
      subject.start_new_frame
      allow(subject.current_frame).to receive(:add_roll_score).with(4)
      allow(subject.current_frame).to receive(:add_roll_score).with(2)
      subject.roll_current_frame(4, 2)
    end

    it 'can call on mark_current_frame when no strike or spare' do
      subject.start_new_frame
      allow(subject).to receive(:mark_current_frame?)
      subject.roll_current_frame(4, 2)
    end

    it 'can call on mark_current_frame when there is a strike' do
      subject.start_new_frame
      allow(subject).to receive(:mark_current_frame?)
      subject.roll_current_frame(10)
    end

    it 'can call on mark_current_frame when there is a spare' do
      subject.start_new_frame
      allow(subject).to receive(:mark_current_frame?)
      subject.roll_current_frame(6, 4)
    end
  end

  describe '#end_current_frame' do
    it 'it adds the current frame to frames' do
      subject.start_new_frame
      subject.roll_current_frame(5, 3)
      expect { subject.end_current_frame }.to change { subject.frames.length }.by(1)
    end

    it 'resets current frame to nil' do
      subject.start_new_frame
      subject.roll_current_frame(5, 3)
      subject.end_current_frame
      expect(subject.frames.last.total_score).to eq 8
      expect(subject.current_frame).to eq nil
    end

    it 'can call on the update_score method' do
      subject.start_new_frame
      subject.roll_current_frame(5, 3)
      allow(subject).to receive(:update_score)
      subject.end_current_frame
    end

    it 'adds first roll to previous frame score if previous frame was a spare' do
      subject.start_new_frame
      subject.roll_current_frame(10)
      subject.end_current_frame
      subject.start_new_frame
      subject.roll_current_frame(6, 3)
      expect { subject.end_current_frame }.to change { subject.frames[0].total_score }.by(9)
    end

    it 'adds total_score to previous frame score if previous frame was a strike' do
      subject.start_new_frame
      subject.roll_current_frame(5, 5)
      subject.end_current_frame
      subject.start_new_frame
      subject.roll_current_frame(6, 3)
      expect { subject.end_current_frame }.to change { subject.frames[0].total_score }.by(6)
    end

    it 'adds first roll to total_score of 2 frames previous, if last 2 frames were strikes' do
      subject.start_new_frame
      subject.roll_current_frame(10)
      subject.end_current_frame
      subject.start_new_frame
      subject.roll_current_frame(10)
      subject.end_current_frame
      subject.start_new_frame
      subject.roll_current_frame(5, 5)
      expect { subject.end_current_frame }.to change { subject.frames[0].total_score }.by(5)
    end
  end
end
