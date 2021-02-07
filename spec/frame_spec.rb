# frozen_string_literal: true

require './lib/frame'
describe Frame do
  let(:test_frame) { Frame.new(1) }
  describe 'initialize' do
    it 'knows which frame number it is' do
      expect(test_frame.frame_number).to eq 1
    end
  end

  describe 'add_roll' do
    it 'will give you the score of two rolls in one frame' do
      test_frame.add_roll(5)
      test_frame.add_roll(4)

      expect(test_frame.rolls[0]).to eq 5
      expect(test_frame.rolls[1]).to eq 4
    end

    it "won't let you roll twice if you score a strike with your first roll" do
      test_frame.add_roll(10)
      expect { test_frame.add_roll(5) }.to raise_error 'Frame complete'
    end
  end

  describe '.strike?' do
    it 'returns true when it is a strike' do
      test_frame.add_roll(10)
      expect(test_frame.strike?).to eq true
    end
    it 'returns false when it is not a strike' do
      test_frame.add_roll(9)
      expect(test_frame.strike?).to eq false
    end
  end

  describe '.spare?' do
    it 'returns true when it is a spare' do
      test_frame.add_roll(6)
      test_frame.add_roll(4)
      expect(test_frame.spare?).to eq true
    end

    it 'returns false when it is a spare' do
      test_frame.add_roll(1)
      test_frame.add_roll(1)
      expect(test_frame.spare?).to eq false
    end
  end

  describe '.add_bonus' do
    it 'retains to bonus' do
      test_frame.add_bonus(5)
      expect(test_frame.bonus).to eq 5
    end
  end
end
