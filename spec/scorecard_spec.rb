# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  describe '#add_score' do
    context 'first roll' do
      it 'adds score to scorecard' do
        subject.add_score(7)
        expect(subject.scorecard[0][0]).to eq 7
      end

      it 'sets @roll to 2 after it is called' do
        expect { subject.add_score 2 }.to change { subject.roll }.by 1
      end

      it 'if score is 10 (strike) begin next frame' do
        expect { subject.add_score(10) }.to change { subject.frame }.by 1
      end

      it 'if score is 10 (strike) next frame starts with @roll = 1' do
        subject.add_score(10)
        expect(subject.roll).to eq 1
      end
    end

    context 'second roll' do
      it 'next frame after second roll' do
        subject.add_score(7)
        expect { subject.add_score 2 }.to change { subject.frame }.by 1
      end
      it 'adds score to sub-array based on the frame' do
        3.times { subject.add_score(0) }
        subject.add_score(4)
        expect(subject.scorecard[1][1]).to eq 4
      end

      it 'raises error if score for frame > 10' do
        subject.add_score 7
        expect { subject.add_score 7 }.to raise_error("Error: Score for frame is greater than 10")
      end
    end
  end

  describe '#calculate_score' do
    it 'can calculate a simple score with no bonuses' do
      subject.add_score(7)
      subject.add_score(1)
      subject.add_score(8)
      subject.add_score(0)
      expect(subject.calculate_score).to eq 16
    end

    it 'takes into account a strike and gives bonus' do
      subject.add_score(Scorecard::STRIKE_SCORE)
      subject.add_score(1)
      subject.add_score(8)
      subject.add_score(0)
      subject.add_score(5)
      expect(subject.calculate_score).to eq 33
    end

    it 'takes into account a spare' do
      subject.add_score(9)
      subject.add_score(1)
      subject.add_score(8)
      subject.add_score(0)
      subject.add_score(5)
      expect(subject.calculate_score).to eq 31
    end

    it 'correctly calculates for strike in 10th frame' do
      18.times { subject.add_score(3) }
      subject.add_score Scorecard::STRIKE_SCORE
      subject.add_score 4
      subject.add_score 6
      expect(subject.calculate_score).to eq 74
    end

    it 'correctly calculates for spare in 10th frame' do
      18.times { subject.add_score(3) }
      subject.add_score 6
      subject.add_score 4
      subject.add_score 6
      expect(subject.calculate_score).to eq 70
    end

    it 'perfect game' do
      12.times { subject.add_score(Scorecard::STRIKE_SCORE) }
      expect(subject.calculate_score).to eq 300
    end

    it 'gutter game' do
      20.times { subject.add_score 0 }
      expect(subject.calculate_score).to eq 0
    end

    it 'does not break for pending strike bonus' do
      subject.add_score Scorecard::STRIKE_SCORE
      expect(subject.calculate_score).to eq 10
    end

    it 'does not break for pending spare bonus' do
      subject.add_score 6
      subject.add_score 4
      expect(subject.calculate_score).to eq 10
    end
  end

  describe '#game_over?' do
    it 'returns true if game is over' do
      20.times { subject.add_score 0 }
      expect(subject.game_over?).to be true
    end

    it 'returns false if still in regular frames' do
      2.times { subject.add_score 0 }
      expect(subject.game_over?).to be false
    end

    it 'returns false if spare in last frame' do
      18.times { subject.add_score 0 }
      subject.add_score 9
      subject.add_score 1
      expect(subject.game_over?).to be false
    end

    it 'returns true if spare into strike in last frame' do
      18.times { subject.add_score 0 }
      subject.add_score 9
      subject.add_score 1
      subject.add_score 10
      expect(subject.game_over?).to be true
    end

    it 'returns false if strike into strike in last frame' do
      18.times { subject.add_score 0 }
      subject.add_score 10
      subject.add_score 10
      expect(subject.game_over?).to be false
    end

    it 'returns true if strike into spare in last frame' do
      18.times { subject.add_score 0 }
      subject.add_score 10
      subject.add_score 9
      subject.add_score 1
      expect(subject.game_over?).to be true
    end

    it 'true if strike in last 3 balls in final frame' do
      18.times { subject.add_score 0 }
      subject.add_score 10
      subject.add_score 10
      subject.add_score 10
      expect(subject.game_over?).to be true
    end

    it 'true if strike into strike into any in final frame' do
      18.times { subject.add_score 0 }
      subject.add_score 10
      subject.add_score 10
      subject.add_score 1
      expect(subject.game_over?).to be true
    end

    it 'returns true if spare into any in last frame' do
      18.times { subject.add_score 0 }
      subject.add_score 9
      subject.add_score 1
      subject.add_score 1
      expect(subject.game_over?).to be true
    end
  end
end
