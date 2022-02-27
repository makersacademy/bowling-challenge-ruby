class Bowling

  def initialize
    @frame= Array.new(10)
    @frame_count = 0
    @frame_elements = []
    @roll = 1
    @strike_count = 0
    @running_total = 0
    @pin = 0
 #   @end_game = false
    @last_pin = 0
  end

  def roll(pin)
  @pin = pin

  if pin == 10
    @frame_elements[0] = 10
    @frame_elements[1] = '-'
    frame
    @frame_elements = []
    @roll = 1 
    @strike_count += 1
  end

  if  @roll == 1 && pin != 10
    @frame_elements[0] = pin
    @roll += 1 
  elsif @roll == 2
    @frame_elements[1] = pin
    @roll = 1
    frame
    @frame_elements = [] 
  end

  #End of game
  if (@frame_count.eql? 10) || (@end_game == true)
    if @strike_count == 10 #All strikes 
      @frame[9][2] = 300
      @strike_count = 0
    end 
    if pin == 10
         @last_pin = 10
    end
      #  if (@last_pin == 10) 
      #    if @strike_count  == 0
      #       @current_frame_count = @frame[@frame_count-1][2].to_i 
      #       puts "CURRENT FRAME '#{@current_frame_count}'"
      #       @frame[9][2] = @current_frame_count  
      #    end
      # end
      #   @frame.delete_at(10)
   #print @frame
    @frame
  end

end

def frame
  @frame[@frame_count] = @frame_elements
  if @frame[@frame_count-1]  != nil #ot first frame
    if(@frame[@frame_count-1][1] == "-") #previous frame is a strike 
      if @pin != 10
       standard 
      end 
    else
      if @pin != 10
        standard 
       end 
    end
  end 
  if @frame[@frame_count-1]  == nil # is the first frame
    if(@frame[@frame_count][1] != "-")   #current is not a strike 
      standard
    end
  end 
  @frame_count += 1
  print @frame
end

def strike
end

def game_score
  @frame[9][2]
end

def standard #Only come here if the current frame is not a strike
  if @strike_count > 0
    if @frame_count > 0
      add_count = @frame[@frame_count].sum.to_i  #current frame  2
      strike1 = add_count + 10   #previous frame 12
      @strike_count -= 1
      strike2 = 0
        if @strike_count > 0   #previous frme -1
          strike2 = 10 + 10 + @frame[@frame_count][0].to_i
          @strike_count -= 1
         end 
      additional_strikes = 0
      @strike_count.times{additional_strikes +=30} 
      @frame[@frame_count][2] = additional_strikes + add_count + @running_total + strike1 +strike2 
      @running_total = @frame[@frame_count][2].to_i 
      @strike_count = 0
    end
    return
  end
  @strike_count = 0
  if @frame_count ==0 #first frame
   add_count = @frame[@frame_count].sum.to_i
   @frame[@frame_count][2] = add_count
   @running_total +=add_count
  else
    add_count = @frame[@frame_count].sum.to_i
    add_count1 = @frame[@frame_count-1][2]
    added  =  add_count + add_count1 
    @frame[@frame_count][2] = added
    @running_total =added
  end
  end
end