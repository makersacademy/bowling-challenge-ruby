@score = 0
@first_throw = 0
@second_throw = 0
@strike = false
@spare = false
@first_bonus = 0
@second_bonus = 0
@frame = 1

while @frame <= 10 do
puts "It is currently frame #{@frame}, enter your first score"
@first_throw = gets.chomp.to_i

if @first_throw == 10
    @score += 10
    @strike = true
        else @score += @first_throw

        puts "It is currently frame #{@frame}, enter your second score"
        @second_throw = gets.chomp.to_i
            if @first_throw + @second_throw == 10
            @score += @second_throw
            @spare = true
            else @score += @second_throw
        end
end




@frame += 1
end