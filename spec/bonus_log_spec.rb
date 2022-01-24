require 'bonus_log'

describe BonusLog do
  describe '.log_strike_bonus' do
    it 'adds two entries, with two adjacent roll numbers' do
      expect(BonusLog).to receive(:log_bonus).with([8, 4])
      expect(BonusLog).to receive(:log_bonus).with([9, 4])
      BonusLog.log_strike_bonus(7, 4)
    end
  end

  describe '.log_spare_bonus' do
    it 'adds one entries, with one adjacent roll numbers' do
      expect(BonusLog).to receive(:log_bonus).with([8, 4])
      BonusLog.log_spare_bonus(7, 4)
    end
  end

  describe '.check_for_frames' do
    it 'returns the frames acssociated with the curent roll' do
      BonusLog.log_strike_bonus(7, 4)
      BonusLog.log_spare_bonus(8, 6)
      BonusLog.log_spare_bonus(7, 3)
      expect(BonusLog.check_for_frames(9)).to eq [4, 6]
    end
  end
end
