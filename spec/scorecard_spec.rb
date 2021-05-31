# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  it 'begins the game with a score of 0' do
    expect(subject.frame_scores.length).to eq 10
    expect(subject.current_score).to eq 0
  end

  it 'begins the game with no bonus rules pending' do
    expect(subject.pending_bonus).to eq nil
  end

  it 'begins the game at Frame 1: Roll 1' do
    expect(subject.current_frame).to eq 1
    expect(subject.current_roll).to eq 1
  end

  it 'can limit the game to 10 Frames' do
    10.times do
      subject.roll_1(1)
      subject.roll_2(2)
    end
    expect(subject.game_over?).to be true
    expect(subject.final_score).to eq 30
  end

  describe '#roll_1' do
    it 'fails when too many pins entered' do
      expect { subject.roll_1(11) }.to raise_error 'Max pins exceeded, recheck and try again'
    end

    it 'stores the roll score at correct point in array' do
      expect { subject.roll_1(5) }.to change { subject.roll_scores }.to([[5]])
    end
    it 'prompts roll_2 if fewer than 10 pins knocked down' do
      expect { subject.roll_1(5) }.to change { subject.current_roll }.from(1).to(2)
    end

    it 'ends the frame if roll 1 = strike' do
      expect { subject.roll_1(10) }.to change { subject.current_frame }.from(1).to(2)
    end

    it 'sets the pending_bonus to strike' do
      expect { subject.roll_1(10) }.to change { subject.pending_bonus }.from(nil).to(:strike)
    end
  end

  describe '#roll_2' do
    it 'fails when too many pins entered' do
      subject.roll_1(5)
      expect { subject.roll_2(6) }.to raise_error 'Max pins exceeded, recheck and try again'
    end
    it 'stores the roll score at correct point in array' do
      subject.roll_1(5)
      expect { subject.roll_2(5) }.to change { subject.roll_scores }.from([[5]]).to([[5,5]])
    end

    it 'increases scores' do
      subject.roll_1(2)
      expect { subject.roll_2(5) }.to change {
                                        subject.frame_scores
                                      }.from([2, 0, 0, 0, 0, 0, 0, 0, 0, 0]).to([7, 0, 0, 0, 0, 0, 0, 0, 0, 0])
      expect(subject.current_score).to eq 7
    end

    it 'sets spare bonus to pending when all 10 pins down' do
      subject.roll_1(5)
      expect { subject.roll_2(5) }.to change { subject.pending_bonus }.from(nil).to(:spare)
    end

    it 'advances to first roll of next frame' do
      subject.roll_1(2)
      expect { subject.roll_2(5) }.to change { subject.current_frame }.by(+1)
      subject.roll_1(2)
      expect { subject.roll_2(5) }.to change { subject.current_roll }.to(1)
    end
  end

  describe '#normal_scoring' do
    it 'adds pins to current frame score' do
      expect { subject.normal_scoring(2) }.to change {
                                                subject.frame_scores
                                              }.from([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]).to([2, 0, 0, 0, 0, 0, 0, 0, 0, 0])
      expect(subject.current_score).to eq 2
    end
  end

  describe '#final_score' do
    it 'fails if your game is incomplete' do
      expect { subject.final_score }.to raise_error 'You have not bowled 10 frames yet'
    end

    it 'returns the final score' do
      10.times do
        subject.roll_1(1)
        subject.roll_2(1)
      end

      expect(subject.final_score).to eq 20
    end
  end

  describe '#spare_scoring' do
    before do
      subject.roll_1(5)
      subject.roll_2(5)
    end
    it 'handles spare bonus' do
      expect { subject.spare_scoring(2) }.to change { subject.current_score }.by(+2)
      expect(subject.current_score).to eq 12
      expect { subject.spare_scoring(2) }.to change { subject.frame_scores[0] }.by(+2)
    end

    it 'resets pending_bonus to nil' do
      expect { subject.spare_scoring(2) }.to change { subject.pending_bonus }.from(:spare).to(nil)
    end
  end

  describe '#strike_scoring' do
    before do
      subject.roll_1(10)
    end
    it 'handles one strike bonus' do
      expect { subject.strike_scoring(2) }.to change { subject.current_score }.by(+2)
      expect(subject.current_score).to eq 12
      expect { subject.strike_scoring(2) }.to change { subject.frame_scores[0] }.by(+2)
    end

    it 'resets pending_bonus to nil' do
      expect { subject.strike_scoring(2) }.to change { subject.pending_bonus }.from(:strike).to(nil)
    end

    it 'copes with two strikes in a row' do
      p subject.frame_scores
      p subject.strike_bonus_holder
      subject.roll_1(10)
      p subject.frame_scores
      p subject.strike_bonus_holder
      subject.roll_1(1)
      p subject.frame_scores
      p subject.strike_bonus_holder
      subject.roll_2(1)
      p subject.frame_scores
      p subject.strike_bonus_holder
      expect(subject.frame_scores).to eq [21, 12, 2, 0, 0, 0, 0, 0, 0, 0]
    end
  end
end
