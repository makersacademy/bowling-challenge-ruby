class Bowling

  attr_accessor :frame
  def initialize(frame)
    @frame = frame
  end

  

  def game
    @myarr = []
  
    while @frame <= 4 do 
      roll = 0
      puts "Frame number = #{frame}"
      2.times do |roll|
        roll += 1
        puts "enter score for roll #{roll}"
        user_input = gets.chomp.to_i 
        @myarr << user_input

        
      end
      puts "my score = #{@myarr.sum}"
      @frame += 1
    end
  end

end
  
game = Bowling.new(1)
game.game