require './lib/scoreboard_controller.rb'

describe Scoreboard_Controller do

  it "You can input a roll on it" do
    bowling = double()
    allow(bowling).to receive(:roll).and_return(1)
    allow(bowling).to receive(:turn).and_return(1,5,11)
    allow(bowling).to receive(:input).and_return(1)
    allow(bowling).to receive(:my_score).and_return(5)
    allow(bowling).to receive(:final_score).and_return(3)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("3")
    expect {scoreboard = Scoreboard_Controller.new(bowling)}.not_to raise_error
  end

  it "You can check your score on it" do
    bowling = double()
    allow(bowling).to receive(:roll).and_return(1)
    allow(bowling).to receive(:turn).and_return(1,11)
    allow(bowling).to receive(:input).and_return(1)
    allow(bowling).to receive(:my_score).and_return(5)
    allow(bowling).to receive(:final_score).and_return(4)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("My Score","3")
    expect {scoreboard = Scoreboard_Controller.new(bowling)}.not_to raise_error
  end

  it "An incorrect input makes you try again" do
    bowling = double()
    allow(bowling).to receive(:roll).and_return(1)
    allow(bowling).to receive(:turn).and_return(1,11)
    allow(bowling).to receive(:input).and_return(1)
    allow(bowling).to receive(:my_score).and_return(5)
    allow(bowling).to receive(:final_score).and_return(4)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("fgrge","3")
    expect {scoreboard = Scoreboard_Controller.new(bowling)}.not_to raise_error
  end

  it "After 10 turns, a final score is presented" do
    bowling = double()
    allow(bowling).to receive(:roll).and_return(1)
    allow(bowling).to receive(:turn).and_return(11)
    allow(bowling).to receive(:input).and_return(1)
    allow(bowling).to receive(:my_score).and_return(5)
    allow(bowling).to receive(:final_score).and_return(4)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("fgrge","3")
    expect {scoreboard = Scoreboard_Controller.new(bowling)}.not_to raise_error
  end

end