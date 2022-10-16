require_relative './frame.rb'
require_relative './game.rb'

class Game
    attr_accessor :frames_all

    def initialize
        @frames_all = []
    end

    def add_frame(frame)
        @frames_all << frame
    end

    # def sum
    #     num = 0
    #     sum = 0

    #     @frames_all.each do |frame|
    #         if n < 10
    #            sum += frame.total + @frames_all[num+1].total + @frames_all[num+2].total
    #         else
    #             sum += frame.total + @frames_all[num+1].total
    #         # else
    #         #     sum += frame.total
    #         end

    #     end
    #     num += 1
    # end
    # return sum
end