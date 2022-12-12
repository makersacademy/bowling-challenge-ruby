require 'scorecard'

describe ScoreCard do
  context 'frame class objects are correctly added to the score array' do
    it ' adds a frame to the array' do
      scorecard = ScoreCard.new
      frame = Frame.new(5, 3)
      scorecard.add(frame)
      expected_scorecard =
        { roll_one: 5, roll_two: 3, frame_total: 8, is_strike?: false, is_spare?: false, bonus_status:false }
      expect(scorecard.display_score).to include (expected_scorecard)
    end
  end
  context "programme correctly handles scoring for spares" do
    it "corectly calculate a spare in the first frame" do
      scorecard = ScoreCard.new
      frame1 = Frame.new(6, 4)
      expect(frame1.bonus_status).to eq true
      frame2 = Frame.new(5, 2)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.calculate_bonuses
      expected_frame1 = { roll_one: 6, roll_two: 4, frame_total: 15, is_strike?: false, is_spare?: true, bonus_status: false }  
      expected_frame2 = { roll_one: 5, roll_two: 2, frame_total: 7, is_strike?: false, is_spare?: false, bonus_status: false }
      expect(scorecard.display_score).to include(expected_frame1)
      expect(scorecard.display_score).to include(expected_frame2)
    end

    it "corectly calculate a spare into a strike" do
      scorecard = ScoreCard.new
      frame1 = Frame.new(5, 5)
      frame2 = Frame.new(10, 0)
      # to ensure unresolves strike bonus does not raise error
      frame3 = Frame.new(0, 0)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.add(frame3)
      scorecard.calculate_bonuses
      expected_frame1 = { roll_one: 5, roll_two: 5, frame_total: 20, is_strike?: false, is_spare?: true, bonus_status: false }
      expected_frame2 = { roll_one: 10, roll_two: 0, frame_total: 10, is_strike?: true, is_spare?: false, bonus_status: false }
      expect(scorecard.display_score).to include(expected_frame1)
      expect(scorecard.display_score).to include(expected_frame2)
    end

    it 'adds no bonus to a gutter frame' do
      scorecard = ScoreCard.new
      frame1 = Frame.new(3, 7)
      frame2 = Frame.new(0, 0)
      scorecard.add(frame1)
      scorecard.add(frame2)
      expected_frame1 = { roll_one: 3, roll_two: 7, frame_total: 10, is_strike?: false, is_spare?: true, bonus_status: false }
      expected_frame2 = { roll_one: 0, roll_two: 0, frame_total: 0, is_strike?: false, is_spare?: false, bonus_status: false }
      expect(scorecard.display_score).to include(expected_frame1)
      expect(scorecard.display_score).to include(expected_frame2)
    end
  end

  context 'programmes correctly handles strikes' do
    it 'correctly handles a strike into an open frame' do
      scorecard = ScoreCard.new
      frame1 = Frame.new(10, 0)
      expect(frame1.bonus_status).to eq true
      frame2 = Frame.new(7, 2)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.calculate_bonuses
      expected_frame1 = { roll_one: 10, roll_two: 0, frame_total: 19, is_strike?: true, is_spare?: false, bonus_status: false }
      expected_frame2 = { roll_one: 7, roll_two: 2, frame_total: 9, is_strike?: false, is_spare?: false, bonus_status: false }
      expect(scorecard.display_score).to include(expected_frame1)
      expect(scorecard.display_score).to include(expected_frame2)
    end

    it 'correctly handles a strike into a spare' do
      scorecard = ScoreCard.new
      frame1 = Frame.new(10, 0)
      frame2 = Frame.new(2, 8)
      # to not isolate spare score
      frame3 = Frame.new(0, 0)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.add(frame3)
      scorecard.calculate_bonuses
      expected_frame1 = { roll_one: 10, roll_two: 0, frame_total: 20, is_strike?: true, is_spare?: false, bonus_status: false }
      expected_frame2 = { roll_one: 2, roll_two: 8, frame_total: 10, is_strike?: false, is_spare?: true, bonus_status: false }
      expect(scorecard.display_score).to include(expected_frame1)
      expect(scorecard.display_score).to include(expected_frame2)
    end

    it 'correctly scores a strike into a strike into an open frame' do
      scorecard = ScoreCard.new
      frame1 = Frame.new(10, 0)
      frame2 = Frame.new(10, 0)
      frame3 = Frame.new(3, 4)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.add(frame3)
      scorecard.calculate_bonuses
      expected_frame1 = { roll_one: 10, roll_two: 0, frame_total: 23, is_strike?: true, is_spare?: false, bonus_status: false }
      expected_frame2 = { roll_one: 10, roll_two: 0, frame_total: 17, is_strike?: true, is_spare?: false, bonus_status: false }
      expected_frame3 = { roll_one: 3, roll_two: 4, frame_total: 7, is_strike?: false, is_spare?: false, bonus_status: false }
      expect(scorecard.display_score).to include(expected_frame1)
      expect(scorecard.display_score).to include(expected_frame2)
      expect(scorecard.display_score).to include(expected_frame3)
    end

    it 'correctly handles 3 strikes in a row' do
      scorecard = ScoreCard.new
      frame1 = Frame.new(10, 0)
      frame2 = Frame.new(10, 0)
      frame3 = Frame.new(10, 0)
      frame4 = Frame.new(0, 0)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.add(frame3)
      scorecard.add(frame4)
      scorecard.calculate_bonuses
      expected_frame1 = { roll_one: 10, roll_two: 0, frame_total: 30, is_strike?: true, is_spare?: false, bonus_status: false }
      expected_frame2 = { roll_one: 10, roll_two: 0, frame_total: 20, is_strike?: true, is_spare?: false, bonus_status: false }
      expected_frame3 = { roll_one: 10, roll_two: 0, frame_total: 10, is_strike?: true, is_spare?: false, bonus_status: false }
      expect(scorecard.display_score).to include(expected_frame1)
      expect(scorecard.display_score).to include(expected_frame2)
      expect(scorecard.display_score).to include(expected_frame3)
    end
  end
  context 'the programme correctly handles the final frame' do
    it 'correctly handles a spare in the final frame' do
      scorecard = ScoreCard.new
      frame1 = Frame.new(0, 0)
      frame2 = Frame.new(0, 0)
      frame3 = Frame.new(0, 0)
      frame4 = Frame.new(0, 0)
      frame5 = Frame.new(0, 0)
      frame6 = Frame.new(0, 0)
      frame7 = Frame.new(0, 0)
      frame8 = Frame.new(0, 0)
      frame9 = Frame.new(0, 0)
      frame10 = Frame.new(0, 10)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.add(frame3)
      scorecard.add(frame4)
      scorecard.add(frame5)
      scorecard.add(frame6)
      scorecard.add(frame7)
      scorecard.add(frame8)
      scorecard.add(frame9)
      scorecard.add(frame10)
      bonus_roll = BonusRoll.new(7, 0)
      scorecard.add_final_frame_bonus(bonus_roll)
      expected_frame10 = { roll_one: 0, roll_two: 10, frame_total: 17, is_strike?: false, is_spare?: true, bonus_status: false }
      expect(scorecard.display_score).to include(expected_frame10)
    end

    it 'correctly handles a spare in the final frame' do
      scorecard = ScoreCard.new
      frame1 = Frame.new(0, 0)
      frame2 = Frame.new(0, 0)
      frame3 = Frame.new(0, 0)
      frame4 = Frame.new(0, 0)
      frame5 = Frame.new(0, 0)
      frame6 = Frame.new(0, 0)
      frame7 = Frame.new(0, 0)
      frame8 = Frame.new(0, 0)
      frame9 = Frame.new(0, 0)
      frame10 = Frame.new(10, 0)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.add(frame3)
      scorecard.add(frame4)
      scorecard.add(frame5)
      scorecard.add(frame6)
      scorecard.add(frame7)
      scorecard.add(frame8)
      scorecard.add(frame9)
      scorecard.add(frame10)
      bonus_roll = BonusRoll.new(10, 10)
      scorecard.add_final_frame_bonus(bonus_roll)
      expected_frame10 = { roll_one: 10, roll_two: 0, frame_total: 30, is_strike?: true, is_spare?: false, bonus_status: false }
      expect(scorecard.display_score).to include(expected_frame10)
    end

    it 'does not allow an early bonus to be added' do
      scorecard = ScoreCard.new
      frame1 = Frame.new(2, 3)
      frame2 = Frame.new(3, 4)
      frame3 = Frame.new(6, 2)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.add(frame3)
      bonus_roll = BonusRoll.new(7, 0)
      expect { scorecard.add_final_frame_bonus(bonus_roll) }.to raise_error
      'bonus rolls can only be added to the 10th frame'
    end
  end

  context 'it runs an entire game' do
    it 'correctly calculates the score' do
      scorecard = ScoreCard.new
      frame1 = Frame.new(3, 4)
      frame2 = Frame.new(3, 3)
      frame3 = Frame.new(7, 2)
      frame4 = Frame.new(4, 5)
      frame5 = Frame.new(0, 5)
      frame6 = Frame.new(0, 9)
      frame7 = Frame.new(5, 4)
      frame8 = Frame.new(2, 4)
      frame9 = Frame.new(4, 4)
      frame10 = Frame.new(8, 0)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.add(frame3)
      scorecard.add(frame4)
      scorecard.add(frame5)
      scorecard.add(frame6)
      scorecard.add(frame7)
      scorecard.add(frame8)
      scorecard.add(frame9)
      scorecard.add(frame10)
      expect(scorecard.final_score).to eq 76
    end

    it 'correctly calculates a game with strikes and spares' do
      scorecard = ScoreCard.new
      frame1 = Frame.new(10, 0)
      frame2 = Frame.new(7, 3)
      frame3 = Frame.new(10, 0)
      frame4 = Frame.new(10, 0)
      frame5 = Frame.new(5, 5)
      frame6 = Frame.new(3, 6)
      frame7 = Frame.new(7, 3)
      frame8 = Frame.new(2, 4)
      frame9 = Frame.new(4, 4)
      frame10 = Frame.new(10, 0)
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.add(frame3)
      scorecard.add(frame4)
      scorecard.add(frame5)
      scorecard.add(frame6)
      scorecard.add(frame7)
      scorecard.add(frame8)
      scorecard.add(frame9)
      scorecard.add(frame10)
      bonus_roll = BonusRoll.new(10, 10)
      scorecard.add_final_frame_bonus(bonus_roll)
      scorecard.display_score
      expect(scorecard.final_score).to eq 163
    end
  end
end
