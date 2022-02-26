# frozen_string_literal: true

require './lib/frame'

describe Frame do
  subject(:frame) { described_class.new }

  context 'invalid input' do
    it 'does not allow rolls less than 0' do
      expect { frame.log_roll(-1) }.to raise_error('Pins downed must be between 0 and 10')
    end

    it 'does not allow rolls greater than 10' do
      expect { frame.log_roll(-1) }.to raise_error('Pins downed must be between 0 and 10')
    end

    it "does not allow rolls greater than what pins are left" do
      frame.log_roll(5)
      expect{frame.log_roll(6)}.to raise_error("Pins downed must be between 0 and 5")
    end
  end

  context 'no rolls' do
    it 'there is no roll' do
      expect(frame.roll_score(1)).to be_nil
    end
  end

  context 'No bonuses' do
    it 'scores a roll' do
      frame.log_roll(5)
      expect(frame.roll_score(1)).to eq 5
    end

    it 'logged the first roll' do
      frame.log_roll(6)
      expect(frame.roll_score(1)).to eq 6
    end

    it 'logged the second roll' do
      frame.log_roll(6)
      frame.log_roll(3)
      expect(frame.roll_score(2)).to eq 3
      expect(frame.roll_score(1)).to eq 6
    end
  end

  context 'With bonuses' do
    it 'scores a spare on the second roll' do
      frame.log_roll(3)
      frame.log_roll(7)
      expect(frame.spare_frame?).to be true
    end

    it 'scores a spare on the second roll if first roll zero' do
      frame.log_roll(0)
      frame.log_roll(10)
      expect(frame.roll_score(2)).to eq 10
      expect(frame.spare_frame?).to be true
    end

    it 'scores a strike on the first roll' do
      frame.log_roll(10)
      expect(frame.roll_score(1)).to eq 10
      expect(frame.strike_frame?).to be true
    end

    it 'scores two strikes on 2 rolls' do
      frame.log_roll(10)
      frame.log_roll(10)
      expect(frame.roll_score(1)).to eq 10
      expect(frame.roll_score(2)).to eq 10
      expect(frame.strike_frame?).to be true
    end

    it 'scores threes strikes on 3 rolls' do
      frame.log_roll(10)
      frame.log_roll(10)
      frame.log_roll(10)
      expect(frame.roll_score(1)).to eq 10
      expect(frame.roll_score(2)).to eq 10
      expect(frame.roll_score(3)).to eq 10
      expect(frame.strike_frame?).to be true
    end

    xit 'scores spare and strikes over 3 rolls' do
      frame.log_roll(3)
      frame.log_roll(7)
      frame.log_roll(10)
      expect(frame.roll_score(1)).to eq 3
      expect(frame.roll_score(2)).to eq :spare
      expect(frame.roll_score(3)).to eq :strike
    end
  end
end
