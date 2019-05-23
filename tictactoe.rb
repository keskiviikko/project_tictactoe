
class Grid
    attr_accessor :possible_choice
    attr_accessor :grid

    def initialize
        @possible_choice = [1,2,3,4,5,6,7,8,9]
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
    @@win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @@game_end = @@win.include?(@@player_one) || @@win.include?(@@player_two)

    def game
        player_one_turns = 0
        puts "**********"
        puts "This is a tic-tac-toe game for two human players."
        puts "You're the first player."
            until @@game_end == true
                puts "Player One, make your choice."
                p @possible_choice
                puts @grid
                player_one_choice()
                puts
                player_one_turns +=1
                break if @@player_one.length == 5
                puts "Player Two, make your choice."
                p @possible_choice
                puts @grid
                player_two_choice()
                puts
            end
    end

    def player_one_choice()
        @@player_one << @possible_choice.delete(gets.chomp.to_i)
        p @@player_one
        if @@win.include?(@@player_one)
            puts "The game has ended. Player One has won!"
        end
    end

    def player_two_choice()
        @@player_two << @possible_choice.delete(gets.chomp.to_i)
        p @@player_two
        if @@win.include?(@@player_two)
            puts "The game has ended. Player Two has won!"
        end
    end
end

new_game = Game.new
new_game.game
