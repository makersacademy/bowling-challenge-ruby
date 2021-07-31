require 'game'
require 'helper_methods'

describe Game do
  before (:each) do
    allow(subject).to receive(:first_roll_input).and_return(5)
    allow(subject).to receive(:second_roll_input).and_return(3)

  end
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

    it 'inits with no frame num' do
      expect(subject.current_frame_num).to eq(nil)
    end
  end

  it 'starting a game creates a new round (1)' do
    subject.start_game
    expect(subject.current_frame_num).to eq(1)
    expect(subject.current_frame_obj).to be_instance_of(Frame)
  end

  it 'is expected to increment round num, and create distinct round' do
    subject.start_game
    subject.first_roll(pins: subject.first_roll_input)
    subject.second_roll(pins: subject.second_roll_input)
    oldframe = subject.current_frame_obj
    subject.end_frame
    newframe = subject.current_frame_obj
    expect(oldframe).not_to eq(newframe)
    expect(subject.current_frame_num).to eq(2)
    expect(subject.all_frames).to include(oldframe)
  end

  describe '#first_roll_input' do
    it 'is expected to ask for user input roll' do
      expect(subject.first_roll_input).to eq(5)
    end

    it 'is expected to record score normally without strike' do
      subject.start_game
      roll_an_eight
      expect(subject.all_frames[0].calculate_score).to eq(8)
    end
  end

  describe '#end_game' do
    it 'is expected to be called at the end of the 10th round' do
      subject.start_game
      9.times { roll_an_eight}
      expect{ roll_an_eight }.to output("Game over! Your total score is:\n").to_stdout
    end
  end

  describe '#total_score' do
    it 'totals the score across two rounds with non/strike/spare rolls' do
      subject.start_game
      roll_an_eight
      roll_an_eight
      expect(subject.total_score).to eq(16)
    end

    it 'totals the score across two rounds when the first round is a spare' do
      subject.start_game
      roll_a_spare
      roll_an_eight
      expect(subject.total_scores[0]).to eq(15)
      expect(subject.total_score).to eq(23)
    end
  end


  
end