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
        expect(new_scorecard.score).to eq({"my team"=>{}})
      end

      it 'entering scores should push to hash' do
        new_scorecard.add_roll(1.1, 5)
        new_scorecard.add_roll(1.2, 3)
        expect(new_scorecard.score).to eq({"my team"=>{1.1=>5, 1.2=>3, 2.1=>0, 2.2=>0, 3.1=>0, 3.2=>0, 4.1=>0, 4.2=>0, 5.1=>0,
          5.2=>0, 6.1=>0, 6.2=>0, 7.1=>0, 7.2=>0, 8.1=>0, 8.2=>0, 9.1=>0, 9.2=>0, 10.1=>0, 10.2=>0, 10.3=>0 }})
      end

      it 'check that resetting scorecard then adding scores pushes to hash' do
        new_scorecard.add_roll(1.1, 5)
        new_scorecard.add_roll(1.2, 3)
        new_scorecard.add_roll(2.1, 2)
        new_scorecard.add_roll(2.2, 7)
        new_scorecard.reset_scorecard
        new_scorecard.add_roll(1.1, 4)
        new_scorecard.add_roll(1.2, 1)
        expect(new_scorecard.score).to eq({"my team"=>{1.1=>4, 1.2=>1}})
     end
  end

  describe '#total' do
    let (:new_scorecard) {Scorecard.new("my team")}
      context 'checking sum without bonuses' do
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
      end
  end

    context 'checks strike bonus' do
      let (:new_scorecard) {Scorecard.new("my team")}
        it 'checks that a strike on roll 1 on frame 1 adds bonus points of next frame' do
          new_scorecard.add_roll(1.1, 10)
          new_scorecard.add_roll(1.2, 0)
          new_scorecard.add_roll(2.1, 5)
          new_scorecard.add_roll(2.2, 3)
          expect(new_scorecard.total(1)).to eq(18)
        end

        it 'checks that a strike on roll 2 of frame 1 adds bonus points of next frame' do
          new_scorecard.add_roll(1.1, 0)
          new_scorecard.add_roll(1.2, 10)
          new_scorecard.add_roll(2.1, 8)
          new_scorecard.add_roll(2.2, 1)
          expect(new_scorecard.total(1)).to eq(19)
        end

        it 'checks that a strike on roll 2 of frame 5 adds bonus points of next frame' do
          new_scorecard.add_roll(1.1, 0)
          new_scorecard.add_roll(1.2, 2)
          new_scorecard.add_roll(2.1, 8)
          new_scorecard.add_roll(2.2, 1)
          new_scorecard.add_roll(3.1, 0)
          new_scorecard.add_roll(3.2, 1)
          new_scorecard.add_roll(4.1, 8)
          new_scorecard.add_roll(4.2, 1)
          new_scorecard.add_roll(5.1, 0)
          new_scorecard.add_roll(5.2, 10)
          new_scorecard.add_roll(6.1, 6)
          new_scorecard.add_roll(6.2, 3)
          expect(new_scorecard.total(6)).to eq(49)
        end

        it 'checks that total calculates without subsequent rolls if a strike is rolled on roll 1 of frame 3' do
          new_scorecard.add_roll(1.1, 0)
          new_scorecard.add_roll(1.2, 2)
          new_scorecard.add_roll(2.1, 8)
          new_scorecard.add_roll(2.2, 1)
          new_scorecard.add_roll(3.1, 0)
          new_scorecard.add_roll(3.2, 10)
          expect(new_scorecard.total(3)).to eq(21)
        end
    end

    context 'checks spare bonus' do
      let (:new_scorecard) {Scorecard.new("my team")}
      it 'checks that a spare on frame 4 adds bonus points of next frame' do
        new_scorecard.add_roll(1.1, 0)
        new_scorecard.add_roll(1.2, 2)
        new_scorecard.add_roll(2.1, 8)
        new_scorecard.add_roll(2.2, 1)
        new_scorecard.add_roll(3.1, 0)
        new_scorecard.add_roll(3.2, 1)
        new_scorecard.add_roll(4.1, 8)
        new_scorecard.add_roll(4.2, 2)
        new_scorecard.add_roll(5.1, 5)
        new_scorecard.add_roll(5.2, 3)
        new_scorecard.add_roll(6.1, 6)
        new_scorecard.add_roll(6.2, 3)
        expect(new_scorecard.total(6)).to eq(44)
      end

      it 'checks that total still calculates if spare at end of frame and next rolls not rolled yet' do
        new_scorecard.add_roll(1.1, 0)
        new_scorecard.add_roll(1.2, 2)
        new_scorecard.add_roll(2.1, 8)
        new_scorecard.add_roll(2.2, 2)
        expect(new_scorecard.total(2)).to eq(12)
      end
    end

    context '10th frame bonuses' do
      let (:new_scorecard) {Scorecard.new("my team")}
        it 'checks 10th frame strike bonuses calculated correctly' do
          new_scorecard.add_roll(1.1, 0)
          new_scorecard.add_roll(1.2, 2)
          new_scorecard.add_roll(2.1, 8)
          new_scorecard.add_roll(2.2, 1)
          new_scorecard.add_roll(3.1, 0)
          new_scorecard.add_roll(3.2, 1)
          new_scorecard.add_roll(4.1, 8)
          new_scorecard.add_roll(4.2, 2)
          new_scorecard.add_roll(5.1, 5)
          new_scorecard.add_roll(5.2, 3)
          new_scorecard.add_roll(6.1, 6)
          new_scorecard.add_roll(6.2, 3)
          new_scorecard.add_roll(7.1, 0)
          new_scorecard.add_roll(7.2, 2)
          new_scorecard.add_roll(8.1, 8)
          new_scorecard.add_roll(8.2, 1)
          new_scorecard.add_roll(9.1, 0)
          new_scorecard.add_roll(9.2, 1)
          new_scorecard.add_roll(10.1, 10)
          new_scorecard.add_roll(10.2, 10)
          new_scorecard.add_roll(10.3, 10)
          expect(new_scorecard.total(10)).to eq(86)
        end
    end
end
