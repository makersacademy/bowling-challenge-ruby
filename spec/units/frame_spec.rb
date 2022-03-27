require 'frame.rb'

describe Frame do

  context 'score' do

  it 'should store a score for the frame' do
    frame = Frame.new
    frame.rolled(6)
    expect(frame.score).to eq 6
  end

  it 'should store a score for all rolls in a frame' do
      frame = Frame.new
      frame.rolled(4)
      frame.rolled(3)
      expect(frame.score).to eq 7
  end

end

  context 'logging a roll' do

    it 'should initialise with a rolls array' do
      frame = Frame.new
      expect(frame.rolls).to eq []
    end

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

      it 'should return true if a strike was rolled' do
        @frame.rolled(10)
        expect(@frame.next_turn?).to eq true
      end

      it 'strike should return true' do
        @frame.rolled(10)
        expect(@frame.previous_was_strike?).to eq true
      end

    end

  end

end