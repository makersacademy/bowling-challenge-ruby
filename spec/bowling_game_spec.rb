require 'bowling_game'

describe BowlingGame do
  let(:new_game) { BowlingGame.new }
  let(:test_roll1) { 5 }
  let(:test_roll2) { 2 }
  let(:test_strike) { 10 }
  let(:test_spare1) { 3 }
  let(:test_spare2) { 7 }

  it 'initializes a new game set up' do
    expect(new_game.current_frame).to eq 1
    expect(new_game.roll_1_score).to eq 0
    expect(new_game.roll_2_score).to eq 0
    expect(new_game.roll_3_score).to eq 0
    expect(new_game.bonus_score).to eq 0
    expect(new_game.total_frame_score).to eq 0
    expect(new_game.strike).to eq false
    expect(new_game.spare).to eq false
    expect(new_game.scorecard).to eq []
  end

  context 'saving score values of each roll per frame' do
    describe '.first_roll' do
      it 'saves result of first roll to the roll_1_score instance variable' do
        new_game.first_roll(test_roll1)
        expect(new_game.roll_1_score).to eq 5
      end
    end

    describe '.second_roll' do
      it 'saves result of second roll to the roll_2_score instance variable' do
        new_game.second_roll(test_roll2)
        expect(new_game.roll_2_score).to eq 2
      end
    end

    describe '.third_roll' do
      it 'saves result of third roll to the roll_3_score instance variable' do
        new_game.third_roll(test_roll2)
        expect(new_game.roll_3_score).to eq 2
      end
    end
  end
end
