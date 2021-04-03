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

    it 'will reject any non-number' do
      expect(test_scorecard.enter_roll('s')).to eq "Invalid score entered, score must be between 0 and 10."
    end

    it 'returns end game if conditions met - all strikes' do
      11.times { test_scorecard.enter_roll(10) }
      expect(test_scorecard.enter_roll(10)).to eq "End Game"
    end

    it 'returns end game if conditions met - all strikes except for spare in last game' do
      9.times { test_scorecard.enter_roll(10) }
      test_scorecard.enter_roll(4)
      test_scorecard.enter_roll(6)
      expect(test_scorecard.enter_roll(10)).to eq "End Game"
    end

    it 'returns end game if conditions met - all strikes except for 4 and 3 in last game' do
      9.times { test_scorecard.enter_roll(10) }
      test_scorecard.enter_roll(4)
      expect(test_scorecard.enter_roll(3)).to eq "End Game"
    end

    it 'further test for end game conditions' do
      9.times { test_scorecard.enter_roll(10) }
      expect(test_scorecard.enter_roll(3)).to eq 3
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

    it 'calculates a score of 274 when 9 strikes in a row, then a spare and last roll of 10' do
      9.times { test_scorecard.enter_roll(10) } # - 240
      test_scorecard.enter_roll(4) #- 248 - 252
      test_scorecard.enter_roll(6) #- 264
      test_scorecard.enter_roll(10) #- 274
      expect(test_scorecard.current_score).to eq 274
    end

    it 'calculates a score of 262 when 9 strikes in a row and then a 4 and 5 on the 10th frame (no 3rd roll)' do
      9.times { test_scorecard.enter_roll(10) } # - 240
      test_scorecard.enter_roll(4) #- 248 - 252
      test_scorecard.enter_roll(5) #- 262
      expect(test_scorecard.current_score).to eq 262
    end

    it 'calculates a score of 270 when 10 strikes in a row and two gutter balls' do
      9.times { test_scorecard.enter_roll(10) } # - 240
      test_scorecard.enter_roll(10) #- 270
      test_scorecard.enter_roll(0)
      test_scorecard.enter_roll(0)
      expect(test_scorecard.current_score).to eq 270
    end

    it 'calculates a score of 95 with assorted rolls including strikes and spares' do
      test_scorecard.enter_roll(10) # 10
      test_scorecard.enter_roll(3) # 16
      test_scorecard.enter_roll(2) # 20
      test_scorecard.enter_roll(6) # 26
      test_scorecard.enter_roll(4) # 30
      test_scorecard.enter_roll(8) # 46
      test_scorecard.enter_roll(0) # 46
      test_scorecard.enter_roll(10) # 56
      test_scorecard.enter_roll(0) # 56
      test_scorecard.enter_roll(0) # 56
      test_scorecard.enter_roll(3) # 59
      test_scorecard.enter_roll(4) # 63
      test_scorecard.enter_roll(5) # 68
      test_scorecard.enter_roll(3) # 71
      test_scorecard.enter_roll(9) # 80
      test_scorecard.enter_roll(0) # 80
      test_scorecard.enter_roll(8) # 88
      test_scorecard.enter_roll(2) # 90
      test_scorecard.enter_roll(5) # 95
      expect(test_scorecard.current_score).to eq 95
    end

    it 'scores 0 in the event of a gutter game - 20 rolls of 0' do
      20.times { test_scorecard.enter_roll(0) }
      expect(test_scorecard.current_score).to eq 0
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
        12.times { test_scorecard.enter_roll(10) }
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

      context 'after three frames' do
        it 'displays the current scorecard, where all three are strikes' do
          test_scorecard.enter_roll(10)
          test_scorecard.enter_roll(10)
          test_scorecard.enter_roll(10)

          expect(test_scorecard.generate_scorecard_info).to eq([
            { frame: 1, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 30 },
            { frame: 2, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 10, frame_score: 20, total_score: 50 },
            { frame: 3, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 0, frame_score: 10, total_score: 60 }
          ])
        end
      end
    end

    context 'after ten frames' do
      it 'displays the current scorecard, where all rolls are strikes' do
        12.times { test_scorecard.enter_roll(10) }

        expect(test_scorecard.generate_scorecard_info).to eq([
          { frame: 1, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 30 },
          { frame: 2, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 60 },
          { frame: 3, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 90 },
          { frame: 4, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 120 },
          { frame: 5, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 150 },
          { frame: 6, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 180 },
          { frame: 7, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 210 },
          { frame: 8, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 240 },
          { frame: 9, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 270 },
          { frame: 10, first_roll: 10, second_roll: 10, third_roll: 10, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 300 }
        ])
      end

      it 'displays the current scorecard, where first nine rolls are strikes and 10th frame is a spare' do
        9.times { test_scorecard.enter_roll(10) }
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(6)
        test_scorecard.enter_roll(10)

        expect(test_scorecard.generate_scorecard_info).to eq([
          { frame: 1, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 30 },
          { frame: 2, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 60 },
          { frame: 3, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 90 },
          { frame: 4, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 120 },
          { frame: 5, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 150 },
          { frame: 6, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 180 },
          { frame: 7, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 210 },
          { frame: 8, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 14, frame_score: 24, total_score: 234 },
          { frame: 9, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 10, frame_score: 20, total_score: 254 },
          { frame: 10, first_roll: 4, second_roll: 6, third_roll: 10, strike: false, spare: true, bonus_points: 10, frame_score: 20, total_score: 274 }
        ])
      end

      it 'displays the current scorecard, where first nine rolls are strikes and 10th frame is a 9' do
        9.times { test_scorecard.enter_roll(10) }
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(5)

        expect(test_scorecard.generate_scorecard_info).to eq([
          { frame: 1, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 30 },
          { frame: 2, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 60 },
          { frame: 3, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 90 },
          { frame: 4, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 120 },
          { frame: 5, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 150 },
          { frame: 6, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 180 },
          { frame: 7, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 20, frame_score: 30, total_score: 210 },
          { frame: 8, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 14, frame_score: 24, total_score: 234 },
          { frame: 9, first_roll: 10, second_roll: nil, strike: true, spare: false, bonus_points: 9, frame_score: 19, total_score: 253 },
          { frame: 10, first_roll: 4, second_roll: 5, third_roll: nil, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 262 }
        ])
      end
    end
  end

  describe '#display_scorecard' do
    context 'it displays a started game' do
      it {
        test_scorecard.enter_roll(4)
        test_scorecard.enter_roll(5)
        expect(test_scorecard.display_scorecard).to eq EXAMPLE_1_B
      }
    end

    context 'it displays a perfect game' do
      it {
        12.times { test_scorecard.enter_roll(10) }
        expect(test_scorecard.display_scorecard).to eq EXAMPLE_3
      }
    end

    context 'it displays a game with spares' do
      it {
        8.times { test_scorecard.enter_roll(10) }
        test_scorecard.enter_roll(9)
        test_scorecard.enter_roll(1)
        test_scorecard.enter_roll(3)
        test_scorecard.enter_roll(7)
        test_scorecard.enter_roll(8)
        expect(test_scorecard.display_scorecard).to eq EXAMPLE_4
      }
    end
  end

  EXAMPLE_1 = "
  Frame |  1  |  2  | Frame-Score | Total-Score\n
  1     |  4  |  5  |      9      |      9     \n
  2     |     |     |             |            \n
  3     |     |     |             |            \n
  4     |     |     |             |            \n
  5     |     |     |             |            \n
  6     |     |     |             |            \n
  7     |     |     |             |            \n
  8     |     |     |             |            \n
  9     |     |     |             |            \n
  10    |     |     |             |            \n
  "

  EXAMPLE_1_B = "Frame |  1  |  2  | Frame-Score | Total-Score\n1     |  4  |  5  |      9      |      9     \n2     |     |     |             |            \n3     |     |     |             |            \n4     |     |     |             |            \n5     |     |     |             |            \n6     |     |     |             |            \n7     |     |     |             |            \n8     |     |     |             |            \n9     |     |     |             |            \n10    |     |     |             |            "

  EXAMPLE_2 = "
  Frame |  1  |  2  | Frame-Score | Total-Score\n
  1     | 10  |  x  |     30      |     30     \n
  2     | 10  |  x  |     30      |     60     \n
  3     | 10  |  x  |     30      |     90     \n
  4     | 10  |  x  |     30      |    120     \n
  5     | 10  |  x  |     30      |    150     \n
  6     | 10  |  x  |     30      |    180     \n
  7     | 10  |  x  |     30      |    210     \n
  8     | 10  |  x  |     30      |    240     \n
  9     | 10  |  x  |     30      |    270     \n
  10    | 10  |10 10|     30      |    300     \n
  "

  EXAMPLE_3 = "Frame |  1  |  2  | Frame-Score | Total-Score\n1     | 10  |  x  |     30      |     30     \n2     | 10  |  x  |     30      |     60     \n3     | 10  |  x  |     30      |     90     \n4     | 10  |  x  |     30      |    120     \n5     | 10  |  x  |     30      |    150     \n6     | 10  |  x  |     30      |    180     \n7     | 10  |  x  |     30      |    210     \n8     | 10  |  x  |     30      |    240     \n9     | 10  |  x  |     30      |    270     \n10    | 10  |10 10|     30      |    300     "

  EXAMPLE_4 = "Frame |  1  |  2  | Frame-Score | Total-Score\n1     | 10  |  x  |     30      |     30     \n2     | 10  |  x  |     30      |     60     \n3     | 10  |  x  |     30      |     90     \n4     | 10  |  x  |     30      |    120     \n5     | 10  |  x  |     30      |    150     \n6     | 10  |  x  |     30      |    180     \n7     | 10  |  x  |     29      |    209     \n8     | 10  |  x  |     20      |    229     \n9     |  9  |  /  |     13      |    242     \n10    |  3  |/   8|     18      |    260     "
end
