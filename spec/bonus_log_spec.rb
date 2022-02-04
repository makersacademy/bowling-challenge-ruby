require 'bonus_log'

describe BonusLog do
  let(:bonus_log) { described_class.new }

  describe '#log_strike_bonus' do
    it 'adds two entries, with two adjacent roll numbers' do
      expect(bonus_log).to receive(:log_bonus).with([8, 4])
      expect(bonus_log).to receive(:log_bonus).with([9, 4])
      bonus_log.log_strike_bonus(7, 4)
    end
  end

  describe '#log_spare_bonus' do
    it 'adds one entry, with one adjacent roll number' do
      expect(bonus_log).to receive(:log_bonus).with([8, 4])
      bonus_log.log_spare_bonus(7, 4)
    end
  end

  describe '#check_for_frames' do
    it 'returns the frames acssociated with the curent roll' do
      bonus_log.log_strike_bonus(7, 4)
      bonus_log.log_spare_bonus(8, 6)
      bonus_log.log_spare_bonus(7, 3)
      expect(bonus_log.check_for_frames(9)).to eq [4, 6]
    end
  end
end
