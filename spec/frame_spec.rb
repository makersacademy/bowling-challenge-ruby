require 'frame'

RSpec.describe Frame do
  context 'initially' do
    it 'constructs a frame' do
      frame = Frame.new([0, 0])

      expect(frame.rolls).to eq [0, 0]
      expect(frame.pins_down).to eq 0
    end

    it 'does not allow invalid inputs' do
      expect{ Frame.new([-1, 2]) }.
      to raise_error 'rolls must be between 1 and 10'
    end

    it 'counts number of pins knocked down' do
      frame_1 = Frame.new([1, 2])
      frame_2 = Frame.new([3, 4])

      expect(frame_1.pins_down).to eq 3
      expect(frame_2.pins_down).to eq 7
    end

    it 'recognises a spare' do
      frame_1 = Frame.new([5, 5])
      frame_2 = Frame.new([5, 3])

      expect(frame_1.spare?).to eq true
      expect(frame_2.spare?).to eq false
    end

    it 'recognises a strike' do
      frame = Frame.new([10])

      expect(frame.strike?).to eq true
    end
  end

  context 'scoring a frame' do
    it 'finds the score for frame without spare or strike' do
      frame_1 = Frame.new([4, 4])
      frame_2 = Frame.new([2, 4])

      expect(frame_1.score).to eq 8
      expect(frame_2.score).to eq 6
    end

    it 'no spare score until another roll throws' do
      frame_1 = Frame.new([4, 6])
      frame_2 = Frame.new([2, 8])

      expect(expect(frame_1.score).to eq nil)

      frame_1.add_spare_bonus(frame_2)

      expect(frame_1.score).to eq 12
    end
  end
end
