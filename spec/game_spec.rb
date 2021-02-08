# frozen_string_literal: true

require 'game'

describe Game do
  let(:frame_one) do
    double(roll_one: nil, roll_two: nil,
           finished?: false)
  end
  let(:frame_two) { double(roll_one: nil, roll_two: nil) }
  let(:frame_class) { double(new: frame_one) }
  let(:game) { Game.new } # WRITE '(frame_class)' AFTER 'Game.new' TO ISOLATE UNIT TESTS
  describe '.bowl' do
    it 'adds score to the total' do
      allow(frame_one).to receive(:roll_one=).with(6).and_return(6)
      allow(frame_one).to receive(:calculate_score).and_return(6)
      allow(frame_one).to receive(:score).and_return(6)
      game.bowl(6)
      expect(game.current_frame.score).to eq 6
    end
  end
  describe '.current_frame_number' do
    it 'returns two after two non-ten rolls' do
      # allow(frame_one).to receive(:roll_one=).with(6).and_return(6)
      # allow(frame_one).to receive(:calculate_score).and_return(6)
      # allow(frame_one).to receive(:finished?).and_return(true)
      game.bowl(6)
      # allow(frame_one).to receive(:roll_one).and_return(6)
      # allow(frame_one).to receive(:roll_two=).with(2).and_return(2)
      # allow(frame_one).to receive(:spare_or_strike?).and_return(false)
      # allow(frame_one).to receive(:strike?).and_return(false)
      # allow(frame_one).to receive(:finished?).and_return(true)
      game.bowl(2)
      game.bowl(5)
      expect(game.current_frame_number).to eq 2
    end
    it 'returns two after a strike' do
      game.bowl(10)
      game.bowl(1)
      expect(game.current_frame_number).to eq 2
    end
  end
  describe '.print_scorecard' do
    it 'should return nil' do
      game.bowl(6)
      expect(game.print_scorecard).to eq nil
    end
    it 'should return nil' do
      scores = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      scores.each { |score| game.bowl(score) }
      expect(game.print_scorecard).to eq nil
    end
  end
  describe '.update_previous_frames' do
    it 'changes frame 1 score after next bowl if frame 1 is a spare' do
      game.bowl(3)
      game.bowl(7)
      game.bowl(5)
      expect(game.frames['frame_1'].score).to eq 15
    end
    it 'changes frame 1 score after next 2 (non-strike) bowls if frame 1 is a strike' do
      game.bowl(10)
      game.bowl(4)
      game.bowl(5)
      expect(game.frames['frame_1'].score).to eq 19
    end
    it 'changes frame 1 score after next 2 (strike) bowls if frame 1 is a strike' do
      game.bowl(10)
      game.bowl(10)
      game.bowl(10)
      expect(game.frames['frame_1'].score).to eq 30
    end
  end
  describe 'tenth frame' do
    it 'adds extra bowl if spare' do
      scores = [10, 10, 10, 10, 10, 10, 10, 10, 10, 6, 4]
      scores.each { |score| game.bowl(score) }
      game.bowl(5)
      expect(game.frames['frame_10'].bonus_roll).to eq 5
      expect(game.frames['frame_10'].score).to eq 15
    end
    it 'adds extra bowl if two strikes' do
      scores = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      scores.each { |score| game.bowl(score) }
      game.bowl(5)
      expect(game.frames['frame_10'].bonus_roll).to eq 5
      expect(game.frames['frame_10'].score).to eq 25
    end
    it "should increase frame 9's score to 30 in a perfect game" do
      scores = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      scores.each { |score| game.bowl(score) }
      expect(game.frames['frame_10'].roll_two).to eq 10
      expect(game.frames['frame_10'].bonus_roll).to eq 10
      expect(game.frames['frame_9'].score).to eq 30
    end
  end
end
