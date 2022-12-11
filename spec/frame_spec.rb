require "frame"

RSpec.describe Frame do
  context "Adds 1 roll" do
    it "score updates when adding a roll of 5" do
      frame = Frame.new
      frame.add_roll(5)
      expect(frame.score).to eq 5
    end

    it "fails unless the roll is an integer" do
      frame = Frame.new

      error_message = "A roll must be an integer"
      expect { frame.add_roll(1.5) }.to raise_error ArgumentError, error_message
      expect { frame.add_roll("Hello world") }.to raise_error ArgumentError, error_message
      
      expect { frame.add_roll(1) }.to_not raise_error
      expect(frame.score).to be 1

      expect { frame.add_roll(1.0) }.to_not raise_error
      expect(frame.score).to be 2
    end
    
    it "fails unless roll is between 0 and 10" do
      frame = Frame.new

      error_message = "A roll must be between 0 and 10"
      expect { frame.add_roll(-1) }.to raise_error ArgumentError, error_message
      expect { frame.add_roll(11) }.to raise_error ArgumentError, error_message
    end
  end
  
  context "Adds 2 rolls" do
    it "score updates when adding a roll of 5 and then 4" do
      frame = Frame.new
      
      frame.add_roll(5)
      expect(frame.score).to eq 5
      
      frame.add_roll(4)
      expect(frame.score).to eq 9
    end

    it "fails if the second roll is not between 0 and 10" do
      frame = Frame.new

      frame.add_roll(0)
      expect(frame.score).to eq 0

      error_message = "A roll must be between 0 and 10"
      expect { frame.add_roll(-1) }.to raise_error ArgumentError, error_message

      frame = Frame.new

      frame.add_roll(0)
      expect(frame.score).to eq 0

      error_message = "A roll must be between 0 and 10"
      expect { frame.add_roll(-1) }.to raise_error ArgumentError, error_message
    end

    it "fails if both rolls add up to more than 10" do
      frame = Frame.new

      frame.add_roll(5)
      expect(frame.score).to eq 5

      error_message = "Both rolls cannot add up to more than 10"
      expect { frame.add_roll(7) }.to raise_error error_message
    end
  end
  
  context "Adds 3 rolls" do
    it "raises error since only 2 rolls can be added per frame" do
      frame = Frame.new
      
      frame.add_roll(5)
      expect(frame.score).to eq 5
      
      frame.add_roll(4)
      expect(frame.score).to eq 9
      
      error_message = "Only two rolls can be made per frame"
      expect { frame.add_roll(1) }.to raise_error error_message
    end
  end
end
