require 'stringio'

class UserInput

  def self.input(array)
    io = StringIO.new
    array.each { |user_input| io.puts user_input }
    io.rewind
    io
  end
end