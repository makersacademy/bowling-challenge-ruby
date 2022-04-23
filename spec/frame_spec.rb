require 'frame'

describe Frame do
    frame = Frame.new(1,4)
    it "Frame should initalize with two bowl scores" do
        expect(frame.bowl1).to eq 1
        expect(frame.bowl2).to eq 4
    end

    it "Frame should create a total score based off the two bowls" do
        expect(frame.total_score).to eq 5
    end

    frame1 = Frame.new(2,5,6)
    it "Frame should take optional input of third score for the 10th round" do
        expect(frame1.bowl3).to eq 6
    end
end