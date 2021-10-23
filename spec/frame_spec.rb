require 'frame'

describe Frame do

  let(:frame) { Frame.new }

  describe '#score' do
    it 'should have score' do
      expect(Frame.new).to respond_to(:score)
    end
  end

  describe '#record_roll' do

    it 'records ordinary roll' do
      frame.record_roll(2)
      frame.record_roll(3)
      expect(frame.rolls).to include(3).and include(2)

    end

    it 'raises error for invalid rolls' do
      frame.record_roll(2)
      expect { frame.record_roll(11) }.to raise_error 'Invalid Roll'
    end


  end

  describe '#rolls' do

    it 'shows half strike' do

      frame.record_roll(3)
      frame.record_roll(7)

      expect(frame.rolls).to include(3).and include('/')
      
    end

    it 'shows strike' do

      frame.record_roll(10)

      expect(frame.rolls).to include('X')
      expect(frame.rolls.length).to be 1

    end

  end

end