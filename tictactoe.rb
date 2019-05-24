
class Grid
    WINNING_COMBOS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
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

    def game
        puts "**********"
        puts "This is a tic-tac-toe game for two human players."
        puts "You're the first player."
        loop do
            player_one_turn()
            puts
                if has_won?
                    puts "The game has ended. Player One has won!"
                    puts
                    return
                end
            break if @@player_one.length == 5
            player_two_turn()
            puts
                if has_won?
                    puts "The game has ended. Player Two has won!"
                    puts
                    return
                end
        end
    end

    def player_one_turn()
        puts "Player One, make your choice:"
        p @possible_choice
        puts @grid
        @@player_one << @possible_choice.delete(gets.chomp.to_i)
        p @@player_one
    end

    def player_two_turn()
        puts "Player Two, make your choice:"
        p @possible_choice
        puts @grid
        @@player_two << @possible_choice.delete(gets.chomp.to_i)
        p @@player_two
    end

    def has_won?
        WINNING_COMBOS.include?(@@player_one.sort) ||
        WINNING_COMBOS.include?(@@player_two.sort)
    end
end

new_game = Game.new
new_game.game
