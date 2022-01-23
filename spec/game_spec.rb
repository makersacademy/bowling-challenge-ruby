require 'game'

describe Game do
  let(:frame1) { [1, 4] }
  let(:frame2) { [4, 5] }
  let(:frame3) { [6, 4] }
  let(:frame4) { [5, 5] }
  let(:frame5) { [10] }
  let(:frame6) { [0, 1] }
  let(:frame7) { [7, 3] }
  let(:frame8) { [6, 4] }
  let(:frame9) { [10, 0] }
  let(:frame10) { [2, 8, 6] }

  it 'initializes a game without any frames' do 
    expect(subject.frames.length).to eq 0
  end

  describe '.add_frame' do 
    it 'creates a new frame' do 
      subject.add_frame(frame1)
      expect(subject.frames.length).to eq 1
    end
  end

  describe '.total_score' do
    context 'there are no spares or strikes' do 
      it 'calculates the score for the game' do 
        subject.add_frame(frame1)
        subject.add_frame(frame2)
        expect(subject.total_score).to eq 14
      end 
    end 
  end

  describe 'detect_strike' do
    it 'identifies a 10 in the first roll of a frame' do 
      # expect(subject.add_frame(frame3)).to eq
    end 
  end 
end
    