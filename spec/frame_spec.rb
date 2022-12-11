require "frame"

RSpec.describe Frame do
  context "initialized frame" do
    it "has an empty score and is active" do
      frame = Frame.new

      expect(frame.score).to eq 0
      expect(frame.status).to eq :active
    end
  end
  
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

      frame = Frame.new
      expect { frame.add_roll(1.0) }.to_not raise_error
      expect(frame.score).to be 1
    end
    
    it "fails unless roll is between 0 and 10" do
      frame = Frame.new

      error_message = "A roll must be between 0 and 10"
      expect { frame.add_roll(-1) }.to raise_error ArgumentError, error_message
      expect { frame.add_roll(11) }.to raise_error ArgumentError, error_message
    end

    it "sets the status to bonus for a strike" do
      frame = Frame.new
      frame.add_roll(10)
      expect(frame.score).to eq 10
      expect(frame.status).to eq :bonus

      frame = Frame.new
      frame.add_roll(5)
      expect(frame.score).to eq 5
      expect(frame.status).to eq :active
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

    it "updates the status when getting a spare" do
      frame = Frame.new

      frame.add_roll(5)
      expect(frame.score).to eq 5
      expect(frame.status).to eq :active
      frame.add_roll(5)
      expect(frame.score).to eq 10
      expect(frame.status).to eq :bonus
    end

    it "updates the status when getting below a spare" do
      frame = Frame.new

      frame.add_roll(5)
      expect(frame.score).to eq 5
      expect(frame.status).to eq :active
      frame.add_roll(4)
      expect(frame.score).to eq 9
      expect(frame.status).to eq :done
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

    it "fails if the first throw was a strike" do
      frame = Frame.new

      frame.add_roll(10)

      error_message = "Can no longer add roll to this frame"
      expect { frame.add_roll(0) }.to raise_error error_message
    end
  end
  
  context "Adds 3 rolls" do
    it "fails since only 2 rolls can be added per frame" do
      frame = Frame.new
      
      frame.add_roll(5)
      expect(frame.score).to eq 5
      
      frame.add_roll(4)
      expect(frame.score).to eq 9
      
      error_message = "Can no longer add roll to this frame"
      expect { frame.add_roll(1) }.to raise_error error_message
    end
  end
end
