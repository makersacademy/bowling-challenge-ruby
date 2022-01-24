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
end