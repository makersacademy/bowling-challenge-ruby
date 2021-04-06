require 'scorecard'

describe Scorecard do
  let(:new_scorecard) { Scorecard.new }
  let(:roll_1) { 4 }
  let(:roll_2) { 2 }
  let(:roll_strike) { 10 }
  let(:roll_spare1) { 7 }
  let(:roll_spare2) { 3 }
  let(:no_strike_spare) { false }
  let(:strike) { true }
  let(:spare) { true }


  it 'initializes a scorecard for a new BowlingGame' do
    expect(new_scorecard.roll_1_score).to eq 0
    expect(new_scorecard.roll_2_score).to eq 0
    expect(new_scorecard.roll_3_score).to eq nil
    expect(new_scorecard.bonus_score).to eq 0
    expect(new_scorecard.total_game_score).to eq 0
    expect(new_scorecard.scorecard).to eq []
  end

  context 'no strike or spare' do
    describe '.update_scorecard' do
      it 'updates the scorecard after two rolls' do
        new_scorecard.roll_1_score = roll_1
        new_scorecard.roll_2_score = roll_2
        expect(new_scorecard.update_scorecard(1, no_strike_spare, no_strike_spare)).to eq([{ "frame_1": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total: 6 } }])
      end
    end
  end

  context 'when there is a strike' do
    describe '.update_scorecard' do
      it 'updates the bonus variable with the 2 roll values of next frame' do
        new_scorecard.roll_1_score = roll_strike
        new_scorecard.update_scorecard(1, no_strike_spare, no_strike_spare)
        new_scorecard.roll_1_score = roll_1
        new_scorecard.update_bonus(new_scorecard.roll_1_score)
        new_scorecard.roll_2_score = roll_2
        new_scorecard.update_bonus(new_scorecard.roll_2_score)
        expect(new_scorecard.bonus_score).to eq 6
        expect(new_scorecard.update_scorecard(2, strike, no_strike_spare)).to eq([{ "frame_1": { roll_1: 10, roll_2: 0, roll_3: nil, bonus: 6, total: 16 } },  { "frame_2": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total:  22 } } ])
      end
    end
  end

  context 'when there is a spare' do
    it 'updates the bonus variable with the next 1 roll value of next frame' do
      new_scorecard.roll_1_score = roll_spare1
      new_scorecard.roll_2_score = roll_spare2
      new_scorecard.update_scorecard(1, no_strike_spare, no_strike_spare)
      new_scorecard.roll_1_score = roll_1
      new_scorecard.update_bonus(new_scorecard.roll_1_score)
      new_scorecard.roll_2_score = roll_2
      expect(new_scorecard.bonus_score).to eq 4
      expect(new_scorecard.update_scorecard(2, no_strike_spare, spare)).to eq([{ "frame_1": { roll_1: 7, roll_2: 3, roll_3: nil, bonus: 4, total: 14 } },  { "frame_2": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total: 20 } }])
    end
  end

  context 'saving values to a scorecard' do
    describe '.update_scorecard' do
      it 'saves roll_1 and roll_2 values to a scorecard' do
        new_scorecard.roll_1_score = roll_spare1
        new_scorecard.roll_2_score = roll_spare2
        new_scorecard.update_scorecard(1, no_strike_spare, no_strike_spare)
        expect(new_scorecard.scorecard).to eq [{ "frame_1": { roll_1:  7, roll_2: 3, roll_3: nil, bonus: 0, total: 10 } }]
      end
    end
  end

  context '10th frame' do
    it 'records the third roll of frame 10' do
    current_frame = 1
    9.times do
      new_scorecard.roll_1_score = roll_1
      new_scorecard.roll_2_score = roll_2
      new_scorecard.update_scorecard(current_frame, no_strike_spare, no_strike_spare)
      current_frame += 1
    end
      new_scorecard.roll_1_score = roll_strike
      new_scorecard.roll_2_score = roll_1
      new_scorecard.roll_3_score = roll_2
      new_scorecard.update_scorecard(10, strike, no_strike_spare)
      expect(new_scorecard.scorecard).to eq [{ "frame_1": { roll_1: 4, roll_2: 2,roll_3: nil, bonus: 0, total: 6 } }, { "frame_2": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total: 12 } }, { "frame_3": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total: 18 } }, { "frame_4": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total: 24 } }, { "frame_5": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total: 30 } }, { "frame_6": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total: 36 } }, { "frame_7": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total: 42 } }, { "frame_8": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total: 48 } }, { "frame_9": { roll_1: 4, roll_2: 2, roll_3: nil, bonus: 0, total: 54 } }, { "frame_10": { roll_1: 10, roll_2: 4, roll_3: 2, bonus: 0, total: 70 } }]
    end
  end

  context 'game has a total score' do
    before do
      new_scorecard.roll_1_score = roll_1
      new_scorecard.roll_2_score = roll_2
      new_scorecard.update_scorecard(1, no_strike_spare, no_strike_spare)
      new_scorecard.roll_1_score = roll_1
      new_scorecard.roll_2_score = roll_2
      new_scorecard.update_scorecard(2, no_strike_spare, no_strike_spare)
    end

    describe '.running_total' do
      it 'has running total of the game' do
        expect(new_scorecard.total_game_score).to eq 12
      end
    end
  end
end
