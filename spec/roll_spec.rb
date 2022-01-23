require 'roll'
require 'frames'

describe Roll do
  context 'first roll of first frame, with less than 10 pins' do
    before(:each) do
      @roll = Roll.new(score_count: 0, strike_count: 0, first_roll: true, this_frame_count: 0)
      @roll.scoring(4)
    end

    describe '#scoring' do
      it 'lets the user input the number of pins they have knocked down' do
        expect(@roll.pins_knocked).to eq 4
      end

      it 'adds the number of pins knocked down to the score total' do
        expect(@roll.score_count).to eq 4
      end

      it 'add_scores adds the number of pins knocked down to the frame score total total' do
        expect(@roll.this_frame_count).to eq 4
      end
    end
  end

  describe '#strike_or_spare' do
    it 'sets a strike bonus if player scores 10 on first roll' do
      @roll = Roll.new(score_count: 0, strike_count: 0, first_roll: true, this_frame_count: 0)
      @roll.scoring(10)
      expect(@roll.strike_or_spare).to eq 'strike'
      expect(@roll.strike_count).to eq 1
    end

    it 'sets a spare bonus if player scores 10 on two rolls' do
      @roll = Roll.new(score_count: 0, strike_count: 0, first_roll: true, this_frame_count: 0)
      @roll.scoring(4)
      @roll.scoring(6)
      expect(@roll.strike_or_spare).to eq 'spare'
    end

    it 'sets a keeps bonus at nil if player scores <10 on rolls' do
      @roll = Roll.new(score_count: 0, strike_count: 0, first_roll: true, this_frame_count: 0)
      @roll.scoring(4)
      @roll.scoring(4)
      @roll.strike_or_spare
      expect(@roll.bonus).to eq nil
    end    
  end

  describe '#next_roll?' do
    it 'it sets up the next roll if only 1 roll has happened and there has been no strike' do
      roll = Roll.new(score_count: 0, strike_count: 0, first_roll: true, this_frame_count: 0)
      roll.scoring(4)
      roll.strike_or_spare
      roll.next_roll?
      expect(roll.first_roll).to eq false
      expect(roll.roll_again).to eq true
    end

    it 'calls the end of roll method if there have been 2 rolls or a strike' do
      roll = Roll.new(score_count: 0, strike_count: 0, first_roll: true, this_frame_count: 0)
      roll.scoring(4)
      roll.next_roll?
      roll.scoring(4)
      roll.next_roll?
      expect(roll.roll_again).to eq false
    end
  end

end