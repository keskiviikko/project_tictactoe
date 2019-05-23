
class Grid
    attr_accessor :grid

    def initialize
        @grid = "
                |----|----|----|   
                |  1 |  2 |  3 |
                |----|----|----|
                |  4 |  5 |  6 |
                |----|----|----|
                |  7 |  8 |  9 |
                |----|----|----|
                "
    end
end

class Game < Grid
    @@player_one = Array.new
    @@player_two = Array.new
    @@player_one_turns = 0
    @@win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @@player_one_win = @@win.include?(@@player_one)
    @@player_two_win = @@win.include?(@@player_two)

    def game()
        puts "**********"
        puts "This is a tic-tac-toe game for two human players."
        puts "You're the first player."
            until @@player_one_win || @@player_two_win
                puts "Player One, make your choice."
                puts @grid
                player_one_choice()
                puts
                @@player_one_turns +=1
                break if @@player_one.length == 5
                puts "Player Two, make your choice."
                puts @grid
                player_two_choice()
                puts
            end
    end

    def player_one_choice()
        @@player_one << gets.chomp.to_i
        p @@player_one
        if @@win.include?(@@player_one)
            puts "The game has ended. Player One has won!"
        end
    end

    def player_two_choice()
        @@player_two << gets.chomp.to_i
        p @@player_two
        if @@win.include?(@@player_two)
            puts "The game has ended. Player Two has won!"
        end
    end
end

new_game = Game.new
new_game.game()
