# frozen_string_literal: true

require_relative '../../lib/frame'
require 'rspec'

describe 'Frame' do
  context 'when Frame is initialised' do
      [10,9,8,7,6,5,4,3,2,1,0].map.with_index do |n,index|
        puts index
    it "should test every combination of rolls (Testing Roll 1 (#{n} pins hit) and Testing Roll 2 (#{index})" do
        roll = Roll.new
        roll.roll_score(n,1)
        roll.roll_score(index,2)
    end


      end

  end
end
