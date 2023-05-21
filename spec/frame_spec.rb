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
      frame1 = Frame.new([1, 2])
      frame2 = Frame.new([3, 4])

      expect(frame1.pins_down).to eq 3
      expect(frame2.pins_down).to eq 7
    end

    it 'recognises a spare' do
      frame1 = Frame.new([5, 5])
      frame2 = Frame.new([5, 3])

      expect(frame1.spare?).to eq true
      expect(frame2.spare?).to eq false
    end

    it 'recognises a strike' do
      frame = Frame.new([10])

      expect(frame.strike?).to eq true
    end
  end

  context 'scoring a basic frame' do
    it 'finds the score for frame without spare or strike' do
      frame1 = Frame.new([4, 4])
      frame2 = Frame.new([2, 4])

      expect(frame1.score).to eq 8
      expect(frame2.score).to eq 6
    end
  end

  context 'scoring a spare' do
    it 'no spare score until another roll is thrown' do
      frame1 = Frame.new([4, 6])
      frame2 = Frame.new([2, 8])

      expect(frame1.score).to eq nil

      frame1.add_spare_bonus(frame2)
      expect(frame1.score).to eq 12
    end

    it 'adds 10 to spare when followed by a strike' do
      frame1 = Frame.new([4, 6])
      frame2 = Frame.new([10])

      frame1.add_spare_bonus(frame2)
      expect(frame1.score).to eq 20
    end
  end

  context 'scoring a strike' do
    it 'no strike score until another 2 rolls are thrown' do
      frame1 = Frame.new([10])
      frame2 = Frame.new([1, 2])

      frame3 = Frame.new([10])
      frame4 = Frame.new([0, 4])

      expect(frame1.score).to eq nil

      frame1.add_strike_bonus(frame2)
      expect(frame1.score).to eq 13

      frame3.add_strike_bonus(frame4)
      expect(frame3.score).to eq 14
    end

    it 'scores nil when adding a bonus frame which is also a strike' do
      frame1 = Frame.new([10])
      frame2 = Frame.new([10])
      
      frame1.add_strike_bonus(frame2)
      expect(frame1.score).to eq nil
    end

    it 'scores nil when next frame is a strike' do
      frame1 = Frame.new([10])
      frame2 = Frame.new([10])

      expect(frame1.score).to eq nil

      frame1.add_strike_bonus(frame2)
      expect(frame1.score).to eq nil
    end

    it 'scores with bonus when next frame a strike and another frame added' do
      frame1 = Frame.new([10])
      frame2 = Frame.new([10])
      frame3 = Frame.new([1, 2])

      expect(frame1.score).to eq nil

      frame1.add_strike_bonus(frame2, frame3)
      expect(frame1.score).to eq 21
    end

    it 'scores with bonus when three strikes in a row' do
      frame1 = Frame.new([10])
      frame2 = Frame.new([10])
      frame3 = Frame.new([10])
      frame4 = Frame.new([1, 2])

      expect(frame1.score).to eq nil

      frame1.add_strike_bonus(frame2)
      expect(frame1.score).to eq nil

      frame1.add_strike_bonus(frame2, frame3)
      expect(frame1.score).to eq 30
      
      frame2.add_strike_bonus(frame3)
      expect(frame2.score).to eq nil

      frame2.add_strike_bonus(frame3, frame4)
      expect(frame2.score).to eq 21
    end
    
    it 'finds frame scores when repeated strikes' do
      frame1 = Frame.new([10])
      frame2 = Frame.new([10])
      frame3 = Frame.new([10])
      frame4 = Frame.new([10])

      frame1.add_strike_bonus(frame2, frame3)
      expect(frame1.score).to eq 30

      frame2.add_strike_bonus(frame3, frame4)
      expect(frame1.score).to eq 30
    end
  end

  context 'on tenth frame' do
    it 'scores a spare' do
      frame = Frame.new([5, 5, 4])
      expect(frame.score).to eq 14
    end

    it 'scores a strike' do
      frame = Frame.new([10, 4, 4])
      expect(frame.score).to eq 18
    end
  end
end
