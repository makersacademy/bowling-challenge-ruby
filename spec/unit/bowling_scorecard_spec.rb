require 'bowling_scorecard'

describe BowlingScorecard do
  let(:test_scorecard) { BowlingScorecard.new }

  describe '#enter_roll' do
    it 'receives the roll score and returns it' do
      expect(test_scorecard.enter_roll(5)).to eq 5
    end

    it 'will reject any score over 10' do
      expect(test_scorecard.enter_roll(11)).to eq "Invalid score entered, score must be between 0 and 10."
    end

    it 'will reject any negative score' do
      expect(test_scorecard.enter_roll(-1)).to eq "Invalid score entered, score must be between 0 and 10."
    end

    it 'will reject any second roll score which bring the total frame score over 10' do
      test_scorecard.enter_roll(5)
      expect(test_scorecard.enter_roll(6)).to eq "Invalid score entered, score must be between 0 and 5."
    end
  end

  describe '#current_score' do
    it 'displays the current score' do
      test_scorecard.enter_roll(5)
      test_scorecard.enter_roll(4)
      test_scorecard.enter_roll(6)
      expect(test_scorecard.current_score).to eq 15
    end

    it 'takes into account the bonus scoring if there is a strike' do
      test_scorecard.enter_roll(10)
      test_scorecard.enter_roll(4)
      test_scorecard.enter_roll(6)
      expect(test_scorecard.current_score).to eq 30
    end

    it 'takes into account the bonus scoring if there is a strike and then another strike' do
      test_scorecard.enter_roll(10)
      test_scorecard.enter_roll(10)
      test_scorecard.enter_roll(4)
      test_scorecard.enter_roll(6)
      expect(test_scorecard.current_score).to eq 54
    end

    it 'takes into account the bonus scoring if there is a spare' do
      test_scorecard.enter_roll(4)
      test_scorecard.enter_roll(6)
      test_scorecard.enter_roll(5)
      expect(test_scorecard.current_score).to eq 20
    end

    it 'calculates a perfect game score of 300 when 12 strikes in a row' do
      12.times { test_scorecard.enter_roll(10) }
      expect(test_scorecard.current_score).to eq 300
    end
  end

  describe '#frame' do
    context 'after 3 rolls, with 1st frame had two rolls' do
      it {
        test_scorecard.enter_roll(5)
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(6)
        expect(test_scorecard.frame).to eq 2
      }
    end

    context 'after 3 rolls, with 1st frame was a strike' do
      it {
        test_scorecard.enter_roll(10)
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(6)
        expect(test_scorecard.frame).to eq 3
      }
    end

    context 'after 11 rolls, all strikes' do
      it {
        11.times { test_scorecard.enter_roll(10) }
        expect(test_scorecard.frame).to eq 10
      }
    end
  end

  describe '#generate_scorecard_info' do
    context 'after one frame' do
      it 'displays the current scorecard' do
        test_scorecard.enter_roll(5)
        test_scorecard.enter_roll(4)
        expect(test_scorecard.generate_scorecard_info).to eq([{ frame: 1, first_roll: 5, second_roll: 4, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 9 }])
      end
    end

    context 'after two frames' do
      it 'displays the current scorecard' do
        test_scorecard.enter_roll(5)
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(4)

        expect(test_scorecard.generate_scorecard_info).to eq([
          { frame: 1, first_roll: 5, second_roll: 4, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 9 },
          { frame: 2, first_roll: 4, second_roll: 4, strike: false, spare: false, bonus_points: 0, frame_score: 8, total_score: 17 },
        ])
      end
    end

    context 'after three frames' do
      it 'displays the current scorecard, where 1st roll is a strike' do
        test_scorecard.enter_roll(10)
        test_scorecard.enter_roll(0)
        test_scorecard.enter_roll(9)
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(4)

        expect(test_scorecard.generate_scorecard_info).to eq([
          { frame: 1, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 9, frame_score: 19, total_score: 19 },
          { frame: 2, first_roll: 0, second_roll: 9, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 28 },
          { frame: 3, first_roll: 4, second_roll: 4, strike: false, spare: false, bonus_points: 0, frame_score: 8, total_score: 36 }
        ])
      end
    end

    context 'after four frames' do
      it 'displays the current scorecard, where 1st roll is a strike and 3rd roll is a spare' do
        test_scorecard.enter_roll(10)
        test_scorecard.enter_roll(0)
        test_scorecard.enter_roll(9)
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(6)
        test_scorecard.enter_roll(8)
        test_scorecard.enter_roll(1)

        expect(test_scorecard.generate_scorecard_info).to eq([
          { frame: 1, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 9, frame_score: 19, total_score: 19 },
          { frame: 2, first_roll: 0, second_roll: 9, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 28 },
          { frame: 3, first_roll: 4, second_roll: 6, strike: false, spare: true, bonus_points: 8, frame_score: 18, total_score: 46 },
          { frame: 4, first_roll: 8, second_roll: 1, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 55 }
        ])
      end
    end

    # context 'after ten frames' do
    #   it 'displays the current scorecard, where 1st roll is a strike and 3rd roll is a spare' do
    #     test_scorecard.enter_roll(10)
    #     test_scorecard.enter_roll(0)
    #     test_scorecard.enter_roll(9)
    #     test_scorecard.enter_roll(4)
    #     test_scorecard.enter_roll(6)
    #     test_scorecard.enter_roll(8)
    #     test_scorecard.enter_roll(1)
    #
    #     expect(test_scorecard.generate_scorecard_info).to eq([
    #       { frame: 1, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 9, frame_score: 19, total_score: 19 },
    #       { frame: 2, first_roll: 0, second_roll: 9, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 28 },
    #       { frame: 3, first_roll: 4, second_roll: 6, strike: false, spare: true, bonus_points: 8, frame_score: 18, total_score: 46 },
    #       { frame: 4, first_roll: 8, second_roll: 1, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 55 }
    #     ])
    #   end
    # end
  end

end
