EXAMPLES = {
  [0] => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10] => [30, 60, 90, 120, 150, 180, 210, 240, 270, 300],
  [0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0] => [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
  [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] => [5,14,29,49,60,61,77,97,117,133]
}

describe Scorecard do

  let ( :scorecard ) { Scorecard.create }
  
  describe ".create" do
    it "should create a new scorecard" do
      expect(scorecard).to be_a Scorecard
    end
  end

  describe ".score" do
    it "should have one argument" do
      expect(scorecard).to respond_to(:score).with(1).argument
    end
    
    EXAMPLES.each do |input, output|
      it "returns #{output} when the input is #{input}" do
        result = scorecard.score(input)
        expect(result).to eq output
      end
    end
  end
end