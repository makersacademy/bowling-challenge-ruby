# frozen_string_literal: true

require 'score'

describe Score do
  let(:score) { Score.new }

  describe '#get_total' do
    context 'returns total score from each frame added'
    it 'returns score from first frame' do
      expect(score.get_total([1, 4])).to eq 5
    end

    it 'returns score from 2 frames' do
      score.get_total([1, 4])
      expect(score.get_total([4, 5])).to eq 14
    end
  end

  describe '#spare' do
    context 'Checks if there is a SPARE'
    it 'returns true' do
      expect(score.spare?([6, 4])).to eq true
    end

    it 'returns false' do
      expect(score.spare?([4, 5])).to eq false
    end
  end

  describe '#strike' do
    context 'Checks if there is a STRIKE'
    it 'returns true' do
      expect(score.strike?([10, 0])).to eq true
      expect(score.strike?([0, 10])).to eq true
    end

    it 'returns false' do
      expect(score.strike?([9, 1])).to eq false
    end
  end

  describe '#add_bonus' do
    context 'a spare is scored'
    it 'adds bonus points if spare' do
      current_frame = [6, 4]
      next_frame = [5, 5]
      expect(score.add_bonus(current_frame, next_frame)).to eq 5
    end

    context 'a strike is scored'
    it 'adds bonus points if strike' do
      current_frame = [10, 0]
      next_frame = [0, 1]
      expect(score.add_bonus(current_frame, next_frame)).to eq 1
    end
  end
end
