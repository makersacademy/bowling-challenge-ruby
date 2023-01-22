@scores = []
@spare = false
@strike = false


@frame = 1

while @frame <= 10 do
    

    puts "It is currently frame #{@frame}, enter your first score"
    @first_throw = gets.chomp.to_i
    @scores << @first_throw
    
    if @strike == true || @spare == true
        @scores << @first_throw
        @spare = false
    end

    puts "It is currently frame #{@frame}, enter your second score"
    @second_throw = gets.chomp.to_i
    @scores << @second_throw
    @frame += 1

    if @strike == true
        @scores << @first_throw
        @strike = false
    end

    if @first_throw == 10
        p "strike"
        @strike = true
        elsif @first_throw + @second_throw == 10
        p "spare"
        @spare = true
    end
    p @scores

if @frame == 11 
    puts "If you scored a spare/strike enter score now"
    @first_throw = gets.chomp.to_i
    @scores << @first_throw
    puts "If you scored a strike enter second score now"
    @second_throw = gets.chomp.to_i
    @scores << @second_throw
    puts "Here are your final scores"
    p @scores
    p @scores.sum
else
end
end
