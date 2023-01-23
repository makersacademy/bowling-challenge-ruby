# /bin/zsh -c "bash -c '/Users/murat/.rvm/bin/rvm ruby-3.2.0 do /Users/murat/.rvm/rubies/ruby-3.2.0/bin/ruby -x /Users/murat/.rvm/gems/ruby-3.2.0/bin/bundle exec /Users/murat/.rvm/rubies/ruby-3.2.0/bin/ruby -r '\"'\"'/Users/murat/Library/Application Support/JetBrains/Toolbox/apps/RubyMine/ch-0/223.8214.60/RubyMine.app/Contents/plugins/ruby/rb/consoles/irb_config.rb'\"'\"' /Users/murat/.rvm/rubies/ruby-3.2.0/bin/irb'"
 @current_frame = { frame_number:1, frame_type:"", final_score:0, bonus:0 , rolls_tally:{ roll_1:"", roll_2:""}}

# {:frame_number=>1, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>"", :roll_2=>""}}
 @frame_scores = [@current_frame]

# [{:frame_number=>1, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>"", :roll_2=>""}}]
 def previous_frame
   @frame_scores.filter{|frames| frames.frame_number == (@current_frame - 1)}
 end



# :previous_frame
 @current_frame = { frame_number:2, frame_type:"Strike", final_score:0, bonus:0 , rolls_tally:{ roll_1:"", roll_2:""}}

# {:frame_number=>2, :frame_type=>"Strike", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>"", :roll_2=>""}}
 # frozen_string_literal: true
 
 class Roll
   attr_reader :roll_count, :hit_type, :pins_hit
   def initialize
     @pins_hit = 0
     @roll_count = 0
   end
   def roll_score(pins_hit)
     roll_count_check
     @roll_count = @roll_count + 1
     @pins_hit = @pins_hit + pins_hit
     @hit_type = self.hit_type_calculator
     if @hit_type == "Strike"
       print "You got a Strike you now move onto your next Frame"
     end
   end
 
 private
 
   def roll_count_check
     if @roll_count > 1
       raise("You can only roll twice a frame")
     end
   end
   def hit_type_calculator
 
     case
     when @pins_hit == 0
       return "Gutter"
     when @pins_hit < 10
       return "Base"
     when (@pins_hit == 10) && (@roll_count == 1)
       return "Strike"
     else
       return "Spare"
 
     end
 
   end
 end
 

# nil

# :hit_type_calculator

 roll_1 = Roll.new

# #<Roll:0x000000010c27dc58 @pins_hit=0, @roll_count=0>
 roll_2 = Roll.new

# #<Roll:0x000000010c27a378 @pins_hit=0, @roll_count=0>
 roll_1.roll_score(4)

# nil
 roll_2.roll_score(3)

# nil
 rol_2

# (irb):53:in `<main>': undefined local variable or method `rol_2' for main:Object (NameError)
# Did you mean?  roll_2
#                roll_1
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/lib/ruby/gems/3.2.0/gems/irb-1.6.2/exe/irb:11:in `<top (required)>'
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/bin/irb:25:in `load'
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/bin/irb:25:in `<main>'
 roll_2

# #<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>
 roll_1

# #<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>
 roll_3 = Roll.new

# #<Roll:0x000000010c599518 @pins_hit=0, @roll_count=0>
 roll_3.roll_score(10)

You got a Strike you now move onto your next Frame=> nil
 roll_3

# #<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>
 @frame_scores

# [{:frame_number=>1, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>"", :roll_2=>""}}]
 @frame_scores[0]

# {:frame_number=>1, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>"", :roll_2=>""}}
 @frame_scores[0][":frame_number"]

# nil
 @frame_scores[0]["frame_number"]

# nil
 @frame_scores[0].frame_number

# (irb):63:in `<main>': undefined method `frame_number' for {:frame_number=>1, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>"", :roll_2=>""}}:Hash (NoMethodError)
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/lib/ruby/gems/3.2.0/gems/irb-1.6.2/exe/irb:11:in `<top (required)>'
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/bin/irb:25:in `load'
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/bin/irb:25:in `<main>'
#  @frame_scores[0]["frame_number"]

# nil
 @frame_scores[0]

# {:frame_number=>1, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>"", :roll_2=>""}}
 @frame_scores[0].keys

# [:frame_number, :frame_type, :final_score, :bonus, :rolls_taken]
 @frame_scores[0][:frame_number]

# 1
 previous_frame_number = @frame_scores[0][:frame_number]

# 1
 @frame_scores[0][:frame_number]

# 1
 @frame_scores[0][:rolls_tally][:roll_1] = roll_1

# #<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>
 @frame_scores[0][:rolls_tally][:roll_2] = roll_2

# #<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>
 @FRAME_SCORES

# nil
 @frame_scores

# [{:frame_number=>1, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}]
 @frame_scores << { frame_number:1, frame_type:"Strike", final_score:0, bonus:0 , rolls_tally:{ roll_1:roll_3, roll_2:""}}

# [{:frame_number=>1, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}, {:frame_number=>1, :frame_type=>"Strike", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}}]
 @frame_scores[0][:frame_number] = 2

# 2
 @frame_scores.reverse

# [{:frame_number=>1, :frame_type=>"Strike", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}}, {:frame_number=>2, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}]
 @frame_scores[0][:bonus] = @frame_scores[1][:rolls_tally][:roll_1].pins_hit + @frame_scores[1][:rolls_tally][:roll_2].pins_hit

# (irb):77:in `<main>': undefined method `pins_hit' for "":String (NoMethodError)
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/lib/ruby/gems/3.2.0/gems/irb-1.6.2/exe/irb:11:in `<top (required)>'
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/bin/irb:25:in `load'
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/bin/irb:25:in `<main>'
#  @frame_scores[1][:rolls_taken][:roll_2].pins_hit
#
# (irb):78:in `<main>': undefined method `pins_hit' for "":String (NoMethodError)
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/lib/ruby/gems/3.2.0/gems/irb-1.6.2/exe/irb:11:in `<top (required)>'
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/bin/irb:25:in `load'
# 	from /Users/murat/.rvm/rubies/ruby-3.2.0/bin/irb:25:in `<main>'
#  @frame_scores[1][:rolls_taken][:roll_2]

# ""
 @frame_scores.reverse

# [{:frame_number=>1, :frame_type=>"Strike", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}}, {:frame_number=>2, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}]
 @frame_scores.reverse

# [{:frame_number=>1, :frame_type=>"Strike", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}}, {:frame_number=>2, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}]
 @frame_scores

# [{:frame_number=>2, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}, {:frame_number=>1, :frame_type=>"Strike", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}}]
 @frame_scores.reverse

# [{:frame_number=>1, :frame_type=>"Strike", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}}, {:frame_number=>2, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}]
 @frame_scores[1][:rolls_tally]

# {:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}
 @frame_scores[0][:rolls_tally]

# {:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}
 @frame_scores

# [{:frame_number=>2, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}, {:frame_number=>1, :frame_type=>"Strike", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}}]
 @frame_scores = @frame_scores.reverse

# [{:frame_number=>1, :frame_type=>"Strike", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}}, {:frame_number=>2, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}]
 @frame_scores[1][:rolls_tally]

# {:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}
 @frame_scores[0][:bonus] = @frame_scores[1][:rolls_tally][:roll_1].pins_hit + @frame_scores[1][:rolls_tally][:roll_2].pins_hit

# 7
 @frame_scores[0][:frame_score] = @frame_scores[1][:rolls_tally][:roll_1].pins_hit + @frame_scores[1][:rolls_tally][:roll_2].pins_hit + @frame_scores[0][:rolls_tally][:roll_1].pins_hit

# 17
 @frame_scores

# [{:frame_number=>1, :frame_type=>"Strike", :final_score=>0, :bonus=>7, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}, :frame_score=>17}, {:frame_number=>2, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}]
 @frame_scores[0][:final_score] = @frame_scores[1][:rolls_tally][:roll_1].pins_hit + @frame_scores[1][:rolls_tally][:roll_2].pins_hit + @frame_scores[0][:rolls_tally][:roll_1].pins_hit

# 17
 @frame_scores

# [{:frame_number=>1, :frame_type=>"Strike", :final_score=>17, :bonus=>7, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c599518 @hit_type="Strike", @pins_hit=10, @roll_count=1>, :roll_2=>""}, :frame_score=>17}, {:frame_number=>2, :frame_type=>"", :final_score=>0, :bonus=>0, :rolls_taken=>{:roll_1=>#<Roll:0x000000010c27dc58 @hit_type="Base", @pins_hit=4, @roll_count=1>, :roll_2=>#<Roll:0x000000010c27a378 @hit_type="Base", @pins_hit=3, @roll_count=1>}}]
