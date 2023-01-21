require_relative '../app'

RSpec.describe Application do

  before(:each) do 
    @io = double :io
    @fake_bowling_calculator = (double :bowling_calculator)
    expect(@io).to receive(:puts).with("Welcome to the Bowling Calculator!")
  end

  xit "Calculate the result for a metch with no strikes or spares" do
    19.times { 
      (expect(@fake_bowling_calculator).to receive(:can_still_play?).and_return(true))
      (expect(@io).to receive(:puts).with("Insert the number of pins knocked out"))
      (expect(@io).to receive(:gets).and_return("1"))
      (expect(@fake_bowling_calculator).to receive(:register_next_roll).and_return("1"))
   }

   (expect(@fake_bowling_calculator).to receive(:can_still_play?).and_return(false))
   (expect(@io).to receive(:puts).with("Insert the number of pins knocked out"))
   (expect(@io).to receive(:gets).and_return("1"))
   (expect(@fake_bowling_calculator).to receive(:register_next_roll).and_return("20"))
   (expect(@io).to receive(:gets).and_return("the very final total score is: 20"))

    app = Application.new(@io, @fake_bowling_calculator)
    app.run

    expect(app.run).to eq "the very final total score is: 20"
  end
end
