require 'frame.rb'

describe Frame do
 
    context "player knocks down 10 pins in first roll" do 
        it "returns strike as true" do
            frame = Frame.new(10, 0)
            expect(frame.strike?).to eq(true)
            expect(frame.spare?).to eq(false)
        end
    end

    context "player knocks down 3 pins in first roll and 2 in second roll" do
       it  "returns sum as 10 with no spares" do
            frame = Frame.new(3, 2)
            expect(frame.strike?).to eq(false)
            expect(frame.sum).to eq(5)
            expect(frame.spare?).to eq(false)
        end
    end

    context "players knocks down 10 pins in two rolls " do
        it "returns true for spates " do
            frame = Frame.new(5, 5)
            expect(frame.spare?).to eq(true)
            expect(frame.strike?).to eq(false)
            expect(frame.sum).to eq(10)
        end
    end

    


end