# frozen_string_literal: true

require 'roll'

describe Roll do
  describe '#set a roll' do
    it 'tests setting one single roll' do
      expect(Roll.new(1, 1, 6)).to be_instance_of Roll
    end
  end

  # describe '#get a roll for a frame' do
  #   it 'tests setting one single roll' do
  #     roll = Roll.new(1,1,6)
  #     expect(Roll.get_score(1,1)).to eq 6
  #   end
  # end
end
