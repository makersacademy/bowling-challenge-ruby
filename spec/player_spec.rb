# frozen_string_literal: true

require 'player'

describe Player do
  let(:points) { double('points', update_roll: false, current_score: 'current score', score_breakdown: 'score breakdown', reset: 'reset', add_final_round_bonus_points: 'add_final_round_bonus_points') }
  let(:points_end_of_frame) { double('points', update_roll: true, current_score: 'current score', score_breakdown: 'score breakdown', reset: 'reset', add_bonus_points: 'add_bonus_points') }
  let(:player) { Player.new('John Smith') }

  describe '#initialize' do
    it 'records players name and their current frame' do
      expect(player.name).to eq 'John Smith'
      expect(player.current_frame).to eq 1
    end
  end

  describe '#pins_knocked_down' do
    it 'sends a message to an instance of the points class to #update_roll' do
      expect(points).to receive(:update_roll)

      player.pins_knocked_down(7, points)
    end

    it 'returns the number of pins knocked down if on roll 1' do
      expect(player.pins_knocked_down(7, points)).to eq 7
    end

    it 'returns the current score at the end of each frame (2 rolls)' do
      player.pins_knocked_down(7, points)

      expect(points_end_of_frame).to receive(:current_score)

      player.pins_knocked_down(1, points_end_of_frame)
    end    
    
    it 'returns the current score at the end of each frame (strike)' do
      expect(points_end_of_frame).to receive(:current_score)

      player.pins_knocked_down(10, points_end_of_frame)
    end

    it 'informs player game has ended after frame 10 by returning the score breakdown' do
      9.times do
        player.pins_knocked_down(4, points)
        player.pins_knocked_down(4, points_end_of_frame)
      end

      player.pins_knocked_down(4, points)

      expect(points_end_of_frame).to receive(:score_breakdown)

      player.pins_knocked_down(4, points_end_of_frame)
    end

    it 'resets the current frame back to 1 after frame 10 complete' do
      10.times do
        player.pins_knocked_down(4, points)
        player.pins_knocked_down(4, points_end_of_frame)
      end

      expect(player.current_frame).to eq 1
    end
  end

  describe '#bonus_roll(number, points)' do
    it 'calls on points to save bonus points for frame 10' do
      expect(points).to receive(:add_final_round_bonus_points)

      player.bonus_roll(5, points)
    end
  end
end
