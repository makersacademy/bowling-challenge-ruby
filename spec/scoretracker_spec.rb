require "scoretracker.rb"

describe ScoreTracker do

  before :each do
    set_up_score_tracker
  end

  describe "#initialize" do
    it 'creates a new @scores Hash' do 
      expect(@scores).to be_a Hash
      expect(@scores).to be_empty
    end

    it 'creates a new @totals Hash' do 
      expect(@totals).to be_a Hash
      expect(@totals).to be_empty
    end

    it 'starts @frame_num at 1' do 
      expect(@tracker.frame_num).to eq 1
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
      add_two_rolls
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

    it "allows 3 rolls in the 10th frame if the first roll is a strike" do 
      9.times { add_two_rolls }

      @tracker.add_roll('10')
      add_two_rolls

      expect(@scores[10].count).to eq 3
      expect(@scores[10]).to eq [10, 5, 2]
    end

    it "raises an error if trying to roll 3 times when the first wasn't a strike" do
      9.times { add_two_rolls }

      @tracker.add_roll('9')
      
      expect{ add_two_rolls }.to raise_error 'Only two rolls allowed!'
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

  describe '#add_frame_total' do 
    it 'totals together the rolls within a frame' do
      add_two_rolls
      @tracker.add_frame_total(1)

      expect(@totals[1]).to eq 7
    end

    it 'adds roll sum to the previous frame score if there was a spare' do
      @tracker.add_roll('5')
      @tracker.add_roll('5')
      @tracker.add_frame_total(1)

      expect(@totals[1]).to eq 10

      add_two_rolls

      @tracker.add_frame_total(2)

      expect(@totals[1]).to eq 17
      expect(@totals[2]).to eq 7
    end

    it "doesn't add bonus to previous frame if it was a strike" do
      @tracker.add_roll('10')
      @tracker.add_frame_total(1)

      expect(@totals[1]).to eq 10

      add_two_rolls

      @tracker.add_frame_total(2)

      expect(@totals[1]).to eq 10
      expect(@totals[2]).to eq 7
    end
  end
end
