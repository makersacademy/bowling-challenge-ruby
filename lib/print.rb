class Print

  def output(param)
    param[@team].each {|key, value| puts "Frame.Roll = #{key} Pins knocked = #{value}" }
  end

end
