require 'manager'

describe Manager do
    it 'responds to the #store scorecard method' do
        expect(subject).to respond_to (:store_frame)
    end

    it 'tests whether scorecard is returned as an array' do
        expect(subject.store_frame).to be_an_instance_of(Array)
    end 
end 