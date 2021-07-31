require 'game'

describe Game do

  describe '#initialize' do
    it {is_expected.to respond_to(:current_frame_obj)}
    it {is_expected.to respond_to(:all_frames)}
    it {is_expected.to respond_to(:current_frame_num)}
    it 'inits with no current frame' do
      expect(subject.current_frame_obj).to eq(nil)
    end
    
    it 'inits with an empty array of all frames' do
      expect(subject.all_frames).to eq([])
    end

    it 'inits with an empty array of all frames' do
      expect(subject.current_frame_num).to eq(1)
    end
  end

  it 'starting a game creates a new round (1)' do
    subject.start_game
    expect(subject.current_frame_num).to eq(1)
    expect(subject.current_frame_obj).to be_instance_of(Frame)
  end

  xit 'is expected to record score normally without strike' do 
    subject.start_game
    subject.first_roll(pins: 1)
    subject.second_roll(pins: 2)
  end

  it 'is expected to increment round num, and create distinct round' do
    subject.start_game
    oldframe = subject.current_frame_obj
    subject.end_frame
    newframe = subject.current_frame_obj
    expect(oldframe).not_to eq(newframe)
    expect(subject.current_frame_num).to eq(2)
    expect(subject.all_frames).to include(oldframe)
  end
  
end