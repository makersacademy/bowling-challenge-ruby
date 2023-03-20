require_relative "../app"

RSpec.describe Application do
  let(:app) { Application.new }
  context "when asking for a user input" do
    xit "should accept a valid input" do
      allow(STDIN).to receive(:gets).and_return("10\n")
      expect { app.ask_for_input }.not_to raise_error 
    end
    xit "should reject invalid input" do
      allow(STDIN).to receive(:gets).and_return("invalid\n")
      expect { app.ask_for_input }.to raise_error(ArgumentError)
    end
  end
  context "when given an input" do
    xit "updates the scorecard" do
      
    end
  end
end