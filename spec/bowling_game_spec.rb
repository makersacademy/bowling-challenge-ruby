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
    expect(new_game.roll_3_score).to eq nil
    expect(new_game.bonus_score).to eq 0
    expect(new_game.total_frame_score).to eq 0
    expect(new_game.strike).to eq false
    expect(new_game.spare).to eq false
    expect(new_game.scorecard).to eq []
  end

  context 'saving score values of each roll per frame' do
    describe '.roll_1' do
      it 'saves result of first roll to the roll_1_score instance variable' do
        new_game.roll_1(test_roll1)
        expect(new_game.roll_1_score).to eq 5
        new_game.roll_1(test_roll2)
        expect(new_game.roll_1_score).to eq 2
      end
    end

    describe '.roll_2' do
      it 'saves result of second roll to the roll_2_score instance variable' do
        new_game.roll_2(test_roll2)
        expect(new_game.roll_2_score).to eq 2
      end
    end

    describe '.roll_3' do
      it 'saves result of third roll to the roll_3_score instance variable' do
        new_game.roll_3(test_roll2)
        expect(new_game.roll_3_score).to eq 2
      end
    end
  end

  context 'player gets a strike' do
    before do
      new_game.roll_1(test_strike)
    end

    it 'changes strike to true when the first roll has a value of 10' do
      expect(new_game.strike).to eq true
    end

    it 'defaults the score of the second_roll to zero' do
      expect(new_game.roll_2_score).to eq 0
    end

    it 'updates the bonus variable with the next 2 roll values of next frame' do
      new_game.roll_1(test_roll1)
      new_game.roll_2(test_roll2)
     expect(new_game.scorecard[0]["frame_1"][:bonus_score]).to eq 7
    end

    it 'changes strike back to false when bonus is added to scorecard' do
      new_game.roll_1(test_strike)
      new_game.update_scorecard
      new_game.roll_1(test_roll1)
      new_game.roll_2(test_roll2)
      expect(new_game.strike).to eq false
    end
  end

  context 'player gets a spare' do
    before do
      new_game.roll_1(test_spare1)
      new_game.roll_2(test_spare2)
    end

    it 'changes spare to true when the roll 1 and 2 equal 10 ' do
      expect(new_game.spare).to eq true
    end

    it 'updates the bonus variable with the next 1 roll value of next frame' do
      new_game.roll_1(test_roll1)
      new_game.roll_2(test_roll2)
      p new_game.scorecard
      p new_game.current_frame
      expect(new_game.scorecard[0]["frame_1"][:bonus_score]).to eq 5
    end

    it 'changes spare back to flase when bonus is added to scorecard' do
      new_game.roll_1(test_roll1)
      new_game.roll_2(test_roll2)
      expect(new_game.spare).to eq false
    end

  end

  context 'moving on to new frames' do
    describe '.next_frame' do
      it 'increases the frame number for each frame played' do
        3.times { new_game.next_frame }
        expect(new_game.current_frame).to eq 4
      end
    end

    it 'increases the frame number by 1 when adding to scorecard is complete' do
      new_game.update_scorecard
      expect(new_game.current_frame).to eq 2
    end
  end

  context 'saving values to a scorecard' do
    describe '.update_scorecard' do
      it 'saves roll_1 and roll_2 values to a scorecard' do
        new_game.roll_1(test_roll1)
        new_game.roll_2(test_roll2)
        expect(new_game.scorecard).to eq [{ "frame_1" => { :roll_1 => 5, :roll_2 => 2, :roll_3 => nil,  :bonus_score => 0 } }]
      end
    end

    describe '.update_scorecard_if_spare' do
      it 'saves bonus values to a scorecard when there is a spare' do
        new_game.roll_1(test_spare1)
        new_game.roll_2(test_spare2)
        new_game.roll_1(test_roll1)
        new_game.roll_2(test_roll2)

        expect(new_game.scorecard).to eq [{ "frame_1" => { :roll_1 => 3, :roll_2 => 7, :roll_3 => nil, :bonus_score => 5 } }, { "frame_2" => { :roll_1 => 5, :roll_2 => 2, :roll_3 => nil, :bonus_score => 0 } }]
      end
    end

    describe '.update_scorecard_if_spare' do
      it 'saves bonus values to a scorecard when there is a strike' do
        new_game.roll_1(test_strike)
        new_game.roll_1(test_roll1)
        new_game.roll_2(test_roll2)

        expect(new_game.scorecard).to eq [{ "frame_1" => { :roll_1 => 10, :roll_2 => 0, :roll_3 => nil, :bonus_score => 7 } }, { "frame_2" => { :roll_1 => 5, :roll_2 => 2, :roll_3 => nil, :bonus_score => 0 } }]
      end
    end
  end

  context '10th frame' do
    it 'allows a third roll if in the 10th frame the first roll equals a strike or spare' do
    9.times {
      new_game.roll_1(test_roll1)
      new_game.roll_2(test_roll2) }
      new_game.roll_1(test_strike)
      new_game.roll_2(test_roll1)
      new_game.roll_3(test_roll2)
      expect(new_game.scorecard).to eq [{"frame_1"=>{:roll_1=>5, :roll_2=>2,:roll_3 => nil, :bonus_score=>0}}, {"frame_2"=>{:roll_1=>5, :roll_2=>2, :roll_3 => nil, :bonus_score=>0}}, {"frame_3"=>{:roll_1=>5, :roll_2=>2, :roll_3 => nil, :bonus_score=>0}}, {"frame_4"=>{:roll_1=>5, :roll_2=>2, :roll_3 => nil, :bonus_score=>0}}, {"frame_5"=>{:roll_1=>5, :roll_2=>2, :roll_3 => nil, :bonus_score=>0}}, {"frame_6"=>{:roll_1=>5, :roll_2=>2, :roll_3 => nil, :bonus_score=>0}}, {"frame_7"=>{:roll_1=>5, :roll_2=>2, :roll_3 => nil, :bonus_score=>0}}, {"frame_8"=>{:roll_1=>5, :roll_2=>2, :roll_3 => nil, :bonus_score=>0}}, {"frame_9"=>{:roll_1=>5, :roll_2=>2, :roll_3 => nil, :bonus_score=>0}},
      {"frame_10"=>{:roll_1=>10, :roll_2=>5, :roll_3 => 2, :bonus_score=>0}}]
    end
  end

  context 'end the game' do
    describe '.end_of_game' do
      it 'returns a confrimation of game ending' do
        expect(new_game.end_of_game).to eq "End of game"
      end
    end
  end

end
