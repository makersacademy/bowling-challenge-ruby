# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  describe '.first_roll' do
    scorecard = Scorecard.new
    it 'returns the first roll' do
      allow(scorecard).to receive(:gets).and_return('5')
      scorecard.first_roll
      expect(scorecard.first_roll_score).to eq 5
    end
  end

  describe '.second_roll' do
    scorecard = Scorecard.new
    it 'returns the second roll' do
      allow(scorecard).to receive(:gets).and_return('5')
      scorecard.second_roll
      expect(scorecard.second_roll_score).to eq 5
    end
  end

  describe '.strike?' do
    scorecard = Scorecard.new
    it 'does not add a strike' do
      scorecard.strike?(5)
      expect(scorecard.strikes).to eq 0
    end
    it 'adds a strike' do
      scorecard.strike?(10)
      expect(scorecard.strikes).to eq 1
    end
  end

  describe '.spare?' do
    scorecard = Scorecard.new
    it 'converts spare to true' do
      allow(scorecard).to receive(:gets).and_return('5')
      scorecard.first_roll
      scorecard.spare?(5)
      expect(scorecard.spare).to eq true
    end
  end

  describe '.strike_calculator' do

    it 'gives the correct score for three strikes' do
      scorecard = Scorecard.new
      3.times { scorecard.strike?(10) }
      scorecard.strike_calculator
      expect(scorecard.score).to eq 50
    end

    it 'gives the correct score for four strikes' do
      scorecard = Scorecard.new
      4.times { scorecard.strike?(10) }
      scorecard.strike_calculator
      expect(scorecard.score).to eq 80
    end

    it 'returns the correct score for greater than 4 strikes' do
      scorecard = Scorecard.new
      7.times { scorecard.strike?(10) }
      scorecard.strike_calculator
      expect(scorecard.score).to eq 170
    end
  end

  describe '.end_of_frame' do
    it 'calls the strike_calculator when neccessary' do
    end
  end

  describe '.spare_calculator' do
    it 'adds the correct score up for a spare' do
    end
  end

  describe '.there_a_spare?' do
    it 'adds the correct score up for a spare' do
    end
  end
end
