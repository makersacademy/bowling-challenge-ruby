require 'game'

describe Game do
  let(:roll_double) { double(:roll) }
  let(:roll_double_1) { double(:roll) }
  let(:roll_double_2) { double(:roll) }
  let(:roll_double_3) { double(:roll) }
  let(:roll_class_double) { double(:roll_class) }
  let(:frame_class_double) { double(:frame_class) }
  let(:frame_double) { double(:frame) }
  subject { described_class.new(roll_class_double, frame_class_double, frame_double) }
  let(:two_rolls_per_frame) { [false, false,
                               true, false, true, false,
                               true, true, false, true, true, false,
                               true, true, true, false, true, true, true, false, 
                               true, true, true, true, false, true, true, true, true, false,
                               true, true, true, true, true, false, true, true, true, true, true, false,
                               true, true, true, true, true, true, false, true, true, true, true, true, true, false,
                               true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, false,
                               true, true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, true, false,
                               true, true, true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, true, true, false]
  }  
  let(:one_roll_first_frame) {  [false,
                                true, false, true, false,
                                true, true, false, true, true, false,
                                true, true, true, false, true, true, true, false, 
                                true, true, true, true, false, true, true, true, true, false,
                                true, true, true, true, true, false, true, true, true, true, true, false,
                                true, true, true, true, true, true, false, true, true, true, true, true, true, false,
                                true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, false,
                                true, true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, true, false,
                                true, true, true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, true, true, false]
  }  
  let(:one_roll_nine_frames_then_three) { [false,
                                            true, false,
                                            true, true, false,
                                            true, true, true, false,
                                            true, true, true, true, false,
                                            true, true, true, true, true, false, 
                                            true, true, true, true, true, true, false, 
                                            true, true, true, true, true, true, true, false, 
                                            true, true, true, true, true, true, true, true, false, 
                                            ]
  }  
  
  before do
    allow(frame_class_double).to receive(:new).and_return(frame_double)
    allow(frame_double).to receive(:add)
  end

  it 'can score a gutter game' do
    allow(roll_class_double).to receive(:new).with(0).and_return(roll_double)
    allow(roll_double).to receive(:pins).and_return(0)
    allow(frame_double).to receive(:ended?).and_return(*two_rolls_per_frame)
    allow(frame_double).to receive(:score).and_return(0)
    allow(frame_double).to receive(:spare?).and_return(false)
    allow(frame_double).to receive(:strike?).and_return(false)
    20.times { subject.roll(0) }
    expect(subject.score).to eq 0 
  end

  it 'can score a game of all 1s' do
    allow(roll_class_double).to receive(:new).with(1).and_return(roll_double)
    allow(roll_double).to receive(:pins).and_return(1)
    allow(frame_double).to receive(:ended?).and_return(*two_rolls_per_frame)
    allow(frame_double).to receive(:score).and_return(2)
    allow(frame_double).to receive(:spare?).and_return(false)
    allow(frame_double).to receive(:strike?).and_return(false)
    20.times { subject.roll(1) }
    expect(subject.score).to eq 20
  end

  it 'can score one spare' do
    allow(roll_class_double).to receive(:new).with(6).and_return(roll_double_1)
    allow(roll_class_double).to receive(:new).with(4).and_return(roll_double_2)
    allow(roll_class_double).to receive(:new).with(3).and_return(roll_double_3)
    allow(roll_class_double).to receive(:new).with(0).and_return(roll_double)
    allow(roll_double_1).to receive(:pins).and_return(6)
    allow(roll_double_2).to receive(:pins).and_return(4)
    allow(roll_double_3).to receive(:pins).and_return(3)
    allow(roll_double).to receive(:pins).and_return(0)
    allow(frame_double).to receive(:ended?).and_return(*two_rolls_per_frame)
    allow(frame_double).to receive(:score).and_return(10, 3, 0)
    allow(frame_double).to receive(:spare?).and_return(true, false)
    allow(frame_double).to receive(:strike?).and_return(false)
    allow(frame_double).to receive(:roll_points).with(1).and_return(3)

    subject.roll(6)
    subject.roll(4)
    subject.roll(3)
    17.times { subject.roll(0) }
    expect(subject.score).to eq 16
  end

  it 'can score one strike' do
    allow(roll_class_double).to receive(:new).with(10).and_return(roll_double_1)
    allow(roll_class_double).to receive(:new).with(1).and_return(roll_double_2)
    allow(roll_class_double).to receive(:new).with(0).and_return(roll_double)
    allow(roll_double_1).to receive(:pins).and_return(10)
    allow(roll_double_2).to receive(:pins).and_return(1)
    allow(roll_double).to receive(:pins).and_return(0)
    allow(frame_double).to receive(:ended?).and_return(*one_roll_first_frame)
    allow(frame_double).to receive(:score).and_return(10, 2, 2, 0) # frame 1 score, frame 2 bonus, frame 2 score, 0 thereafter
    allow(frame_double).to receive(:spare?).and_return(false)
    allow(frame_double).to receive(:strike?).and_return(true, false) # true once, then false thereafter

    subject.roll(10)
    subject.roll(1)
    subject.roll(1)
    16.times { subject.roll(0) }
    expect(subject.score).to eq 14
  end

  it 'can score a perfect game' do
    final_frame_double = double(:final_frame)
    game = described_class.new(roll_class_double, frame_class_double, final_frame_double)
    allow(roll_class_double).to receive(:new).with(10).and_return(roll_double)
    allow(roll_double).to receive(:pins).and_return(10)
    allow(frame_double).to receive(:ended?).and_return(*one_roll_nine_frames_then_three)
    allow(frame_double).to receive(:score).and_return(10)
    allow(frame_double).to receive(:spare?).and_return(false)
    allow(frame_double).to receive(:strike?).and_return(true)
    allow(final_frame_double).to receive(:ended?).and_return(true, true, true, true, true, true, true, true, true, false, false, false)
    allow(final_frame_double).to receive(:add)
    allow(final_frame_double).to receive(:score).and_return(10)
    allow(final_frame_double).to receive(:spare?).and_return(false)
    allow(final_frame_double).to receive(:strike?).and_return(true)
    allow(final_frame_double).to receive(:bonus_score).and_return(20)
    allow(frame_double).to receive(:roll_points).with(1).and_return(10)
    allow(final_frame_double).to receive(:roll_points).with(1).and_return(10)
    allow(final_frame_double).to receive(:roll_points).with(2).and_return(10)
    
    12.times { game.roll(10) }
    expect(game.score).to eq 300
  end
end
