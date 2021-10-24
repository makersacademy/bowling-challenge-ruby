# frozen_string_literal: true

require 'game'

describe Game do
  let(:game) { Game.new }

  describe '.initialize' do
    it 'sets @rolls to an empty array' do
      expect(game.rolls).to eq([])
    end
  end

  describe '#score' do
    context 'when only gutter balls are thrown' do
      it 'scores the game as 0' do
        20.times { game.roll(0) }
        expect(game.score).to eq(0)
      end
    end

    context 'when one pin is knocked down each roll' do
      it 'scores the game as 20' do
        20.times { game.roll(1) }
        expect(game.score).to eq(20)
      end
    end

     # The test for a perfect game doesn't seem to be working. Receiving this error 'TypeError:
     # nil can't be coerced into Integer' because it is unable to (+ next_roll + @rolls[current_roll + 2])
    context 'when there is a perfect game' do
       it 'scores 300' do
         12.times { game.roll(10) }
        expect(game.score).to eq(300)
       end
     end

    context 'when a spare is thrown' do
      it 'records the frame score as 10 + the number from the next round (twice to include the bonus)' do
        game.roll(5)
        game.roll(5)
        game.roll(3)
        # 3.times  { game.roll(5) }
        17.times { game.roll(0) }
        expect(game.score).to eq(16)
        # total is 5+5 (+3 for bonus) = 16
      end
    end

    context 'when one strike is thrown' do
      it 'records the frame score as 10 + total knocked down in the next 2 rounds' do
        game.roll(10) # rolling a strike moves straight to the next frame
        game.roll(7)
        game.roll(1)
        16.times { game.roll(0) }
        expect(game.score).to eq(26)
      end
    end
  end
end

# it 'should provide the total score of a frame correctly' do
#   game.roll(3)
#   game.roll(6)
#   expect(game.score).to eq(9)
# end

# it 'should provide the total score of a frame correctly' do
#   game = Game.new(:roll_one, :roll_two)
#   allow(game).to receive(:roll_one) { 3 }
#   allow(game).to receive(:roll_two) { 6 }
#   expect(game.total_of_frame).to eq(9)
# end

# it 'should determine when a spare is rolled' do
#   game = Game.new(6, 4)
#   expect(game.spare?).to be true
# end

# it 'should determine when a strike is rolled' do
#   game = Game.new(10, 0)
#   expect(game.strike?).to be true
# end

# it 'can calculate a gutter game' do
#   game = Game.new(:roll_one, :roll_two)
#   20.times(game.roll(0))
#   expect(game.score).to eq 0
# end
