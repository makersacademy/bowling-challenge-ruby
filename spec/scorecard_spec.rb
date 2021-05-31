# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  it 'begins the game with a score of 0' do
    expect(subject.frame_scores.length).to eq 10
    expect(subject.current_score).to eq 0
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
    it 'fails when not expecting roll 1 data' do
      subject.roll_1(0)
      expect { subject.roll_1(5) }.to raise_error 'You are not on roll_1, recheck and try again'
    end

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

    it 'sets the frame bonus type to strike' do
      expect { subject.roll_1(10) }.to change { subject.frame_bonus_type[0] }.from(0).to(:strike)
    end
  end

  describe '#roll_2' do
    it 'fails when too many pins entered' do
      subject.roll_1(5)
      expect { subject.roll_2(6) }.to raise_error 'Max pins exceeded, recheck and try again'
    end

    it 'fails when not expecting roll 2 data' do
      expect { subject.roll_2(5) }.to raise_error 'You are not on roll_2, recheck and try again'
    end
    it 'stores the roll score at correct point in array' do
      subject.roll_1(5)
      expect { subject.roll_2(5) }.to change { subject.roll_scores }.from([[5]]).to([[5, 5]])
    end

    it 'increases scores' do
      subject.roll_1(2)
      expect { subject.roll_2(5) }.to change {
                                        subject.frame_scores
                                      }.from([2, 0, 0, 0, 0, 0, 0, 0, 0, 0]).to([7, 0, 0, 0, 0, 0, 0, 0, 0, 0])
      expect(subject.current_score).to eq 7
    end

    it 'sets the frame bonus type to spare' do
      subject.roll_1(5)
      expect { subject.roll_2(5) }.to change { subject.frame_bonus_type[0] }.from(0).to(:spare)
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
    it 'handles 1 spare bonus' do
      expect { subject.spare_scoring(2) }.to change { subject.current_score }.by(+2)
      expect(subject.current_score).to eq 12
      expect { subject.spare_scoring(2) }.to change { subject.frame_scores[0] }.by(+2)
    end

    it 'handles 2 spares in a row' do
      subject.roll_1(3)
      subject.roll_2(7)
      subject.roll_1(2)
      subject.roll_2(0)
      expect(subject.frame_scores[0]).to eq 13
      expect(subject.frame_scores[1]).to eq 12
    end
  end

  describe 'strikes' do
    before do
      subject.roll_1(10)
    end
    it 'handles one strike bonus' do
      expect { subject.strike_scoring(2) }.to change { subject.current_score }.by(+2)
      expect(subject.current_score).to eq 12
      expect { subject.strike_scoring(2) }.to change { subject.frame_scores[0] }.by(+2)
    end

    it 'copes with two strikes in a row' do
      subject.roll_1(10)
      subject.roll_1(1)
      subject.roll_2(1)
      expect(subject.frame_scores).to eq [21, 12, 2, 0, 0, 0, 0, 0, 0, 0]
    end
  end

  describe '#roll_3' do
    it 'fails if no strike/spare in 10th frame' do
      expect { subject.roll_3(10) }.to raise_error 'You are not eligible for a third roll'
    end
  end
end
