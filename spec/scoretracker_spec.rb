require "scoretracker.rb"

describe ScoreTracker do

  before :each do
    @tracker = ScoreTracker.new
    @scores = @tracker.scores
  end

  describe "#initialize" do
    it 'creates a new Hash' do 
      expect(@scores).to be_a Hash
      expect(@scores).to be_empty
    end
  end

  describe "#add_roll" do
    it 'adds a roll into an array within the @scores Hash' do
      @tracker.add_roll('5')
      expect(@scores[1]).to be_a Array
      expect(@scores[1].count).to eq 1
      expect(@scores[1]).to eq [5]
    end

    it 'adds a second roll into an existing array within the @scores Hash' do
      @tracker.add_roll('5')
      @tracker.add_roll('2')
      expect(@scores[1]).to be_a Array
      expect(@scores[1].count).to eq 2
      expect(@scores[1]).to eq [5, 2]
    end

    it "updates @frame_num at the end of the second roll" do 
      expect(@tracker.frame_num).to eq 1
      @tracker.add_roll('5')
      expect(@tracker.frame_num).to eq 1
      @tracker.add_roll('2')
      expect(@tracker.frame_num).to eq 2
    end

    it "updates the @frame_num if first roll of frame == 10" do 
      expect(@tracker.frame_num).to eq 1
      @tracker.add_roll('10')
      expect(@tracker.frame_num).to eq 2
    end
  end

  describe '#update_frame' do 
    it "updates @frame_num by 1" do
      expect(@tracker.frame_num).to eq 1
      @tracker.update_frame
      expect(@tracker.frame_num).to eq 2
    end

    it "doesn't update @frame_num if @frame_num == 10" do
      15.times { @tracker.update_frame }
      expect(@tracker.frame_num).to eq 10
    end
  end
end