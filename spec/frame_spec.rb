require 'frame.rb'

describe Frame do
  it 'should store the score for the frame' do
    frame = Frame.new
    frame.rolled(8)
    expect(frame.score).to eq 8
  end

  it 'should store the score for both rolls in a frame' do
      frame = Frame.new
      frame.rolled(3)
      frame.rolled(5)
      expect(frame.score).to eq 8
  end


  context 'next frame' do
    before do
      @frame = Frame.new
    end

    context 'with no strike or spare' do
      it 'should return false if the player has rolled once' do
        @frame.rolled(6)
        expect(@frame.next_turn?).to eq false
      end
      it 'should return true if the player has rolled twice' do
        @frame.rolled(4)
        @frame.rolled(3)
        expect(@frame.next_turn?).to eq true
      end

    end

    context 'with strike' do
      it 'strike should return true' do
        @frame.rolled(10)
        expect(@frame.strike?).to eq true
      end

    end

    context 'with spare' do

      it 'should return false if a frame is not a spare' do
        @frame.rolled(3)
        expect(@frame.spare?).to eq false
      end

      it 'should return true if a frame is a spare' do
        @frame.rolled(7)
        @frame.rolled(3)
        expect(@frame.spare?).to eq true
      end

    end

  end

end