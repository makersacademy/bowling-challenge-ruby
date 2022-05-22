# frozen_string_literal: true

describe EleventhFrame do

  describe '#run' do

    it 'correctly records one roll for a frame 10 spare' do
      frame = EleventhFrame.new(true)
      $stdin = UserInput.input([5,4])
      frame.run
      expect(frame.strike?).to eq(false)
      expect(frame.spare?).to eq(false)
      expect(frame.roll_one).to eq(5)
      expect(frame.roll_two).to eq(nil)
    end

    it 'correctly records two rolls for a frame 10 strike' do
      frame = EleventhFrame.new(false)
      $stdin = UserInput.input([5,4])
      frame.run
      expect(frame.strike?).to eq(false)
      expect(frame.spare?).to eq(false)
      expect(frame.roll_one).to eq(5)
      expect(frame.roll_two).to eq(4)
    end
  end
end