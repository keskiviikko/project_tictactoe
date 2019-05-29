
class Grid
    WINNING_COMBOS = [
        [1,2,3],[4,5,6],[7,8,9],
        [1,4,7],[2,5,8],[3,6,9],
        [1,5,9],[3,5,7]
    ]
    attr_accessor :possible_choice
    attr_accessor :positions
    attr_accessor :grid

    def initialize
        @possible_choice = [1,2,3,4,5,6,7,8,9]
        @positions = {
            pos_one: 1,
            pos_two: 2,
            pos_three: 3,
            pos_four: 4,
            pos_five: 5,
            pos_six: 6,
            pos_seven: 7,
            pos_eight: 8,
            pos_nine: 9
        }
        @grid = "
                |----|----|----|   
                |  #{@positions[:pos_one]} |  #{@positions[:pos_two]} |  #{@positions[:pos_three]} |
                |----|----|----|
                |  #{@positions[:pos_four]} |  #{@positions[:pos_five]} |  #{@positions[:pos_six]} |
                |----|----|----|
                |  #{@positions[:pos_seven]} |  #{@positions[:pos_eight]} |  #{@positions[:pos_nine]} |
                |----|----|----|
                "
    end
end

class Game < Grid
    @@player_one = Array.new
    @@player_two = Array.new

    def game
        puts
        puts "*** This is a tic-tac-toe game for two human players. ***"
        puts
        loop do
            player_one_turn()
            puts
                if has_won?(@@player_one)
                    puts "The game has ended. Player One has won!"
                    puts
                    return
                end
            break if @@player_one.length == 5
            player_two_turn()
            puts
                if has_won?(@@player_two)
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
        p "Player One has chosen: #{@@player_one}"
    end

    def player_two_turn()
        puts "Player Two, make your choice:"
        p @possible_choice
        puts @grid
        @@player_two << @possible_choice.delete(gets.chomp.to_i)
        p "Player Two has chosen: #{@@player_two}"
    end

    def add_markers
        
    end

    def has_won?(player)
        WINNING_COMBOS.any? { |combo| (player & combo).size == combo.size}
    end
end

new_game = Game.new
new_game.game
