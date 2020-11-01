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

    it 'updates @roll_num' do
      expect(@tracker.roll_num).to eq 0
      @tracker.add_roll('5')
      expect(@tracker.roll_num).to eq 1
    end
  end
end