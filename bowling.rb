def bowling
a = rand(0...10)
aa = rand(0...(10-a))
b = rand(0...10)
bb = rand(0...(10-a))
c = rand(0...10)
cc = rand(0...(10-a))
d = rand(0...10)
dd = rand(0...(10-a))
e = rand(0...10)
ee = rand(0...(10-a))
f = rand(0...10)
ff = rand(0...(10-a))
g = rand(0...10)
gg = rand(0...(10-a))
h = rand(0...10)
hh = rand(0...(10-a))
i = rand(0...10)
ii = rand(0...(10-a))
j = rand(1...10)
jj = rand(1...(10-j))




@total = a + aa + b + bb + c + cc + d + dd + e + ee + f + ff + g + gg + h + hh + i + ii + j + jj

if a == 10
    @total = @total + b + bb
end

if b == 10
    @total = @total + c + cc
end

if c == 10
    @total = t@otal + d + dd
end

if d == 10
    @total = @total + e + ee
end

if e == 10
    @total = @total + f + ff
end

if f == 10
    @total = @total + g + gg
end

if g == 10
    @total = @total + h + hh
end

if h == 10
  @total = @total + i + ii
end

if i == 10
    @total = @total + j + jj
end



# wwwwwwwwwwwwwwwww

if a + aa == 10
    @total = @total + b
end

if b+bb == 10
    @total = @total + c
end

if c+cc == 10
    @total = @total + d
end

if d+dd == 10
    @total = @total + e
end

if e+ee == 10
    @total = @total + f
end

if f+ff == 10
    @total = @total + g
end

if g+gg == 10
    @total = @total + h
end

if h+hh == 10
  @total = @total + i
end

if i+ii == 10
    @total = @total + j
end

# if j == 10
#     @total = @total + jj + jjj
# end

# if j + jj == 10
#     @total = @total + jjj
# end

# if jj == 10
#     jjj = rand(1...10)
# elsif j == 10
#     jjj = rand(1...(10-jj))
# end


puts "first rack first bowl is #{a}"
puts "first rack second bowl is #{aa}"
puts "second rack first bowl is #{b}"
puts "second rack second bowl is #{bb}"
puts "third rack first bowl is #{c}"
puts "third rack second bowl is #{cc}"
puts "fourth rack first bowl is #{d}"
puts "fourth rack second bowl is #{dd}"
puts "fifth rack first bowl is #{e}"
puts "fifth rack second bowl is #{ee}"
puts "sixth rack first bowl is #{f}"
puts "sixth rack second bowl is #{ff}"
puts "seventh rack first bowl is #{g}"
puts "seventh rack second bowl is #{gg}"
puts "eighth rack first bowl is #{h}"
puts "eighth rack second bowl is #{hh}"
puts "ninth rack first bowl is #{i}"
puts "ninth rack second bowl is #{ii}"
puts "tenth rack first bowl is #{j}"
puts "tenth rack second bowl is #{jj}"
if j == 10
    jjj = rand(1...(10-jj))
    puts "tenth rack third bowl is #{jjj}"
    @total = @total + jjj
elsif j + jj == 10
    jjj = rand(1...10)
    puts "tenth rack third bowl is #{jjj}"
    @total = @total + jjj
end
puts "Your total score is #{@total}"

end


print bowling