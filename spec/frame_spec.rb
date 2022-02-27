# frozen_string_literal: true

require 'frame'

describe Frame do
  describe '#set up a new frame' do
    it 'tests setting up one frame' do
      expect(Frame.new(1, 0, 0, 0, 0)).to be_instance_of Frame
    end
  end

  # describe '#get a roll for a frame' do
  #   it 'tests setting one single roll' do
  #     roll = Roll.new(1,1,6)
  #     expect(Roll.get_score(1,1)).to eq 6
  #   end
  # end
end
