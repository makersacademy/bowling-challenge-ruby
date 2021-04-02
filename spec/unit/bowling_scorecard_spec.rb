require 'bowling_scorecard'

describe BowlingScorecard do
  let(:test_scorecard) { BowlingScorecard.new }

  describe '#enter_roll' do
    it 'receives the roll score and returns it' do
      expect(test_scorecard.enter_roll(5)).to eq 5
    end

    it 'will reject any score over 10' do
      expect(test_scorecard.enter_roll(11)).to eq "Invalid score entered, entered_score must be between 0 and 10."
    end

    it 'will reject any negative score' do
      expect(test_scorecard.enter_roll(-1)).to eq "Invalid score entered, entered_score must be between 0 and 10."
    end
  end

  describe '#current_score' do
    it 'displays the current score' do
      test_scorecard.enter_roll(5)
      test_scorecard.enter_roll(4)
      test_scorecard.enter_roll(6)
      expect(test_scorecard.current_score).to eq 15
    end
  end

  describe '#frame' do
    it 'returns the frame' do
      test_scorecard.enter_roll(5)
      test_scorecard.enter_roll(4)
      test_scorecard.enter_roll(6)
      expect(test_scorecard.frame).to eq 2
    end
  end

  describe '#display_scorecard' do
    context 'after one frame' do
      it 'displays the current scorecard' do
        test_scorecard.enter_roll(5)
        test_scorecard.enter_roll(4)
        expect(test_scorecard.display_scorecard).to eq [{ frame: 1, first_roll: 5, second_roll: 4 , roll_score: 9, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 9 }]
      end
    end

    context 'after two frames' do
      pending it 'displays the current scorecard' do
        test_scorecard.enter_roll(5)
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(4)
        expect(test_scorecard.display_scorecard).to eq [
          { frame: 1, first_roll: 5, second_roll: 4 , roll_score: 9, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 9 },
          { frame: 2, first_roll: 4, second_roll: 4 , roll_score: 8, strike: false, spare: false, bonus_points: 0, frame_score: 8, total_score: 17 },
        ]
      end
    end
  end

end
