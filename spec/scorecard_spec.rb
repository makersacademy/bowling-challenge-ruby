require 'scorecard'

describe Scorecard do
  describe '#score and #reset_scorecard' do
    let (:new_scorecard) {Scorecard.new("my team")}
      it 'using the #reset_score_card method should return emptied nested hash scorecard with team name' do
        new_scorecard.add_roll(1.1, 5)
        new_scorecard.add_roll(1.2, 3)
        new_scorecard.add_roll(2.1, 2)
        new_scorecard.add_roll(2.2, 7)
        new_scorecard.reset_scorecard
        expect(new_scorecard.score).to eq({"my team"=>{1.1=>0, 1.2=>0, 2.1=>0, 2.2=>0}})
      end

      it 'entering scores should push to hash' do
        new_scorecard.add_roll(1.1, 5)
        new_scorecard.add_roll(1.2, 3)
        expect(new_scorecard.score).to eq({"my team"=>{1.1=>5, 1.2=>3 }})
      end

      it 'check that resetting scorecard then adding scores pushes to hash' do
        new_scorecard.add_roll(1.1, 5)
        new_scorecard.add_roll(1.2, 3)
        new_scorecard.add_roll(2.1, 2)
        new_scorecard.add_roll(2.2, 7)
        new_scorecard.reset_scorecard
        new_scorecard.add_roll(1.1, 4)
        new_scorecard.add_roll(1.2, 1)
        expect(new_scorecard.score).to eq({"my team"=>{1.1=>4, 1.2=>1, 2.1=>0, 2.2=>0, }})
     end
  end

  describe '#total' do
    let (:new_scorecard) {Scorecard.new("my team")}
    it 'checks that total adds one frame together' do
      new_scorecard.add_roll(1.1, 5)
      new_scorecard.add_roll(1.2, 3)
      expect(new_scorecard.total(1)).to eq(8)
    end

    it 'checks that total adds 4 frames together' do
      new_scorecard.add_roll(1.1, 5)
      new_scorecard.add_roll(1.2, 3)
      new_scorecard.add_roll(2.1, 2)
      new_scorecard.add_roll(2.2, 4)
      new_scorecard.add_roll(3.1, 6)
      new_scorecard.add_roll(3.2, 1)
      new_scorecard.add_roll(4.1, 2)
      new_scorecard.add_roll(4.2, 1)
      expect(new_scorecard.total(4)).to eq(24)
    end

    it 'checks that a strike on roll 1 adds bonus points of next frame' do
      new_scorecard.add_roll(1.1, 10)
      new_scorecard.add_roll(1.2, 0)
      new_scorecard.add_roll(2.1, 5)
      new_scorecard.add_roll(2.2, 3)
      expect(new_scorecard.total(1)).to eq(18)
    end

    it 'checks that a strike on roll 2 adds bonus points of next frame' do
      new_scorecard.add_roll(1.1, 0)
      new_scorecard.add_roll(1.2, 10)
      new_scorecard.add_roll(2.1, 8)
      new_scorecard.add_roll(2.2, 1)
      expect(new_scorecard.total(1)).to eq(19)
    end

    end
  end
