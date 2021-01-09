require 'Game'

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

  describe '#start_game' do
    it 'begings the game and proceeds to first frame' do
      subject.start_game
      expect(subject.current_turn).to eq 1
      expect(subject.current_frame).to be_kind_of Frame
    end
  end

  describe '#play_current_frame' do
    it 'updates the current frame based on rolls' do
      subject.start_game
      subject.play_current_frame(5, 3)
      expect(subject.current_frame.throws).to eq [5, 3]
    end

    it 'will work for a strike also' do
      subject.start_game
      subject.play_current_frame(10)
      expect(subject.current_frame.throws).to eq [10]
    end
  end

  describe '#end_current_frame' do
    it 'it adds the current frame to frames' do
      subject.start_game
      subject.play_current_frame(5, 3)
      expect { subject.end_current_frame }.to change { subject.frames.length }.by(1)
    end

    it 'resets current frame to nil' do
      subject.start_game
      subject.play_current_frame(5, 3)
      subject.end_current_frame
      expect(subject.frames.last.total_score).to eq 8
      expect(subject.current_frame).to eq nil
    end
  end
end
