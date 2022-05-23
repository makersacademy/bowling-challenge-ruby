# frozen_string_literal: true

describe TwelfthFrame do
  describe '#run' do
    it 'correctly records one roll' do
      frame = TwelfthFrame.new
      $stdin = UserInput.input([5])
      frame.run
      expect(frame.strike?).to eq(false)
      expect(frame.spare?).to eq(false)
      expect(frame.roll_one).to eq(5)
      expect(frame.roll_two).to eq(nil)
    end
    it 'correctly records a strike' do
      frame = TwelfthFrame.new
      $stdin = UserInput.input([10])
      frame.run
      expect(frame.strike?).to eq(true)
      expect(frame.spare?).to eq(false)
      expect(frame.roll_one).to eq(10)
      expect(frame.roll_two).to eq(nil)
    end
  end
end