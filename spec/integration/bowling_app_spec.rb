#require_relative '../../bowling_app'

#context 'when user enters ten on first roll' do
#  it 'should end the frame' do
#    bowling_app = BowlingApp.new
#    allow(bowling_app).to receive(:gets).and_return('1\n')
#    expect(bowling_app.run!).to output("This is Frame 1").to_stdoutput
#  end 
#end