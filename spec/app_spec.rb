require_relative '../app'

RSpec.describe Application do

  before(:each) do 
    @io = double :io
    @fake_bowling_calculator = (double :bowling_calculator)
    expect(@io).to receive(:puts).with('Welcome to the Bowling Calculator!')
  end

  xit 'Calculate the result for a metch with no strikes or spares' do
    20.times { 
      (expect(@fake_bowling_calculator).to receive(:can_still_play?).and_return(true))
      (expect(@io).to receive(:puts).with('Insert the number of pins knocked out'))
      (expect(@io).to receive(:gets).and_return('1'))
      (expect(@fake_bowling_calculator).to receive(:register_next_roll).with(1))
   }

   (expect(@fake_bowling_calculator).to receive(:can_still_play?).and_return(false))
   (expect(@fake_bowling_calculator).to receive(:get_score).and_return(20))

    app = Application.new(@io, @fake_bowling_calculator)
    app.run
  end
end
