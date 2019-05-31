
class Grid
    WINNING_COMBOS = [
        [1,2,3],[4,5,6],[7,8,9],
        [1,4,7],[2,5,8],[3,6,9],
        [1,5,9],[3,5,7]
    ]
    attr_accessor :possible_choice
    attr_accessor :marker_positions

    def initialize
        @possible_choice = [1,2,3,4,5,6,7,8,9]
        @marker_positions = [7,8,9,4,5,6,1,2,3]
    end
    
    def grid
        puts "
                |----|----|----|   
                |  #{@marker_positions[0]} |  #{@marker_positions[1]} |  #{@marker_positions[2]} |
                |----|----|----|
                |  #{@marker_positions[3]} |  #{@marker_positions[4]} |  #{@marker_positions[5]} |
                |----|----|----|
                |  #{@marker_positions[6]} |  #{@marker_positions[7]} |  #{@marker_positions[8]} |
                |----|----|----|
                "
    end
end

class Game < Grid
    @@player_one = Array.new
    @@player_two = Array.new

    def game
        puts
        puts "  This is a tic-tac-toe game for two human players."
        puts "  Be careful to select available numbers only!"
        puts
        loop do
            player_one_turn()
            puts
                if has_won?(@@player_one)
                    puts "  The game has ended. Player One has won!"
                    puts
                    add_x
                    grid
                    return
                end
            break if @@player_one.length == 5 || @@player_one.include?(nil)
            player_two_turn()
            puts
                if has_won?(@@player_two)
                    puts "  The game has ended. Player Two has won!"
                    puts
                    add_o
                    grid
                    return
                end
            break if @@player_two.include?(nil)
        end
    end

    def player_one_turn()
        puts "Player One, make your choice:"
        p @possible_choice
        add_o
        grid
        @@player_one << @possible_choice.delete(gets.chomp.to_i)
        p "Player One has chosen: #{@@player_one}"
    end

    def player_two_turn()
        puts "Player Two, make your choice:"
        p @possible_choice
        add_x
        grid
        @@player_two << @possible_choice.delete(gets.chomp.to_i)
        p "Player Two has chosen: #{@@player_two}"
    end

    def add_x
        if @@player_one.include?(1)
            @marker_positions[6] = "X"
        end
        if @@player_one.include?(2)
            @marker_positions[7] = "X"
        end
        if @@player_one.include?(3)
            @marker_positions[8] = "X"
        end
        if @@player_one.include?(4)
            @marker_positions[3] = "X"
        end
        if @@player_one.include?(5)
            @marker_positions[4] = "X"
        end
        if @@player_one.include?(6)
            @marker_positions[5] = "X"
        end
        if @@player_one.include?(7)
            @marker_positions[0] = "X"
        end
        if @@player_one.include?(8)
            @marker_positions[1] = "X"
        end
        if @@player_one.include?(9)
            @marker_positions[2] = "X"
        end
    end

    def add_o
        if @@player_two.include?(1)
            @marker_positions[6] = "O"
        end
        if @@player_two.include?(2)
            @marker_positions[7] = "O"
        end
        if @@player_two.include?(3)
            @marker_positions[8] = "O"
        end
        if @@player_two.include?(4)
            @marker_positions[3] = "O"
        end
        if @@player_two.include?(5)
            @marker_positions[4] = "O"
        end
        if @@player_two.include?(6)
            @marker_positions[5] = "O"
        end
        if @@player_two.include?(7)
            @marker_positions[0] = "O"
        end
        if @@player_two.include?(8)
            @marker_positions[1] = "O"
        end
        if @@player_two.include?(9)
            @marker_positions[2] = "O"
        end
    end

    def has_won?(player)
        WINNING_COMBOS.any? { |combo| (player & combo).size == combo.size}
    end
end

new_game = Game.new
new_game.game
