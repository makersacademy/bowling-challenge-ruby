# frozen_string_literal: true

require 'score_card'

describe ScoreCard do
  let(:bowl) { ScoreCard.new }
  let(:frame) { double :frame }
  describe '#frames' do
    it 'should be 1 by default' do
      expect(bowl.frames).to eq []
    end
  end

  describe '#roll' do
    it 'saves each frame in an array' do
      bowl.roll(4)
      bowl.roll(2)

      expect(bowl.frames.length).to eq 1
    end
    it 'saves each frame seperately' do
      bowl.roll(10)
      bowl.roll(6)
      bowl.roll(1)
      bowl.roll(7)

      expect(bowl.frames.length).to eq 3
    end
  end

  describe 'total' do
    it 'should be able to calculate the total score' do
      bowl.roll(3)
      bowl.roll(6)
      bowl.roll(1)
      bowl.roll(7)

      expect(bowl.total).to eq 17
    end
    it 'should calculate a bonus for a strike as well' do
      bowl.roll(10)
      bowl.roll(5)
      bowl.roll(3)

      expect(bowl.total).to eq 26
    end

    it 'should calculate a spare as well' do
      bowl.roll(9)
      bowl.roll(1)
      bowl.roll(5)
      bowl.roll(3)

      expect(bowl.total).to eq 23
    end

    it 'knows what to do with a double strike' do
      bowl.roll(10)
      bowl.roll(10)
      bowl.roll(4)
      bowl.roll(2)
      bowl.roll(2)
      bowl.roll(1)

      expect(bowl.total).to eq 49
    end

    it 'can take a perfect run before the 10th round' do
      9.times { bowl.roll(10) }
      bowl.roll(0)

      expect(bowl.play(0)).to eq 270
    end
  end

  describe '#tenth_round' do
    it 'should allow a third roll if the first roll is a strike' do
      18.times { bowl.play(4) }
      bowl.play(10)
      bowl.play(3)
      bowl.play(2)

      expect(bowl.frames.length).to eq 10
    end
    it 'returns the final score when the game ends' do
      18.times { bowl.play(4) }
      bowl.play(3)

      expect(bowl.play(3)).to eq 78
    end
    it 'should calculate the right bonus for the final round with strike' do
      18.times { bowl.play(4) }
      bowl.play(10)
      bowl.play(3)

      expect(bowl.play(2)).to eq 87
    end
    it 'should not allow a third roll if the first roll is not a strike nor a spare' do
      18.times { bowl.play(4) }
      bowl.play(4)
      bowl.play(4)

      expect(bowl.play(4)).to eq 'Game ended! Your score was 80'
    end
    it 'should allow a third roll if the first roll is a strike' do
      18.times { bowl.play(4) }
      bowl.play(10)
      bowl.play(4)
      bowl.play(4)

      expect(bowl.play(4)).to eq 'Game ended! Your score was 90'
    end
    it 'should allow a third roll if the first to rolls were a spare' do
      18.times { bowl.play(4) }
      bowl.play(6)
      bowl.play(4)
      bowl.play(4)

      expect(bowl.play(4)).to eq 'Game ended! Your score was 86'
    end
  end

  describe 'perfect round' do
    it 'should end with a score of 300' do
      11.times { bowl.play(10) }

      expect(bowl.play(10)).to eq 300
    end
  end
end
