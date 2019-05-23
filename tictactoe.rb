
class Grid
    attr_accessor :grid

    BOX_ONE = 1
    BOX_TWO = 2
    BOX_THREE = 3
    BOX_FOUR = 4
    BOX_FIVE = 5
    BOX_SIX = 6
    BOX_SEVEN = 7
    BOX_EIGHT = 8
    BOX_NINE = 9

    def initialize
        @grid = "
                |----|----|----|   
                |  #{BOX_ONE} |  #{BOX_TWO} |  #{BOX_THREE} |
                |----|----|----|
                |  #{BOX_FOUR} |  #{BOX_FIVE} |  #{BOX_SIX} |
                |----|----|----|
                |  #{BOX_SEVEN} |  #{BOX_EIGHT} |  #{BOX_NINE} |
                |----|----|----|
                "
    end
end

class Game < Grid
    @@player_one_turns = 0
    @@win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @@player_one = Array.new
    @@player_two = Array.new

    def game()
        puts "**********"
        puts "This is a tic-tac-toe game for two human players."
        puts "You're the first player."
            until @@player_one_turns == 5
                puts "Player One, make your choice."
                puts @grid
                player_one_choice()
                puts
                @@player_one_turns +=1
                break if @@player_one_turns == 5
                puts "Player Two, make your choice."
                puts @grid
                player_two_choice()
                puts
            end
    end

    def player_one_choice()
        @@player_one << gets.chomp
        if @@player_one.include?(@@win)
            puts "The game has ended. Player One has won!"
        end
    end

    def player_two_choice()
        @@player_two << gets.chomp
        if @@player_two.include?(@@win)
            puts "The game has ended. Player Two has won!"
        end
    end
end

new_game = Game.new
new_game.game()
