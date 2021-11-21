# frozen_string_literal: true
# require 'frame'
#
# describe Frame do
#
#   frame = Frame.new
#
#   describe 'turn1' do
#     it 'accepts user input for their first turn count of pins' do
#       allow($stdin).to receive(:gets).and_return('5')
#       @t1p = $stdin.gets.chomp
#
#       expect(@t1p).to eq(5)
#     end
#   end
#
#   describe 'turn2' do
#     it 'accepts user input for their second turn count of pins' do
#       allow($stdin).to receive(:gets).and_return('4')
#       @t2p = $stdin.gets.chomp
#
#       expect(@t2p).to eq(4)
#     end
#   end
#
#   describe 'strike' do
#     it 'prints congrats message' do
#       expect output.to eq('Great job on the strike')
#     end
#   end
#
#   describe 'spare' do
#     it 'prints congrats message' do
#       expect output.to eq('Great job on the spare')
#     end
#   end
# end
