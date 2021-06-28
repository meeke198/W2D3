require './board1.rb'
require './human_player.rb'

class Game
def initialize(player_1_mark, player_2_mark)
    @board = Board.new
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @current_player = @player_1
end

def switch_turn
    if @current_player == @player_1
        return @current_player = @player_2
    else
        return @current_player = @player_1
    end
end

def play
    while @board.empty_positions? 
        @board.print
        @board.place_mark(@current_player.get_position, @current_player.mark_value)
        if @current_player.win?(@current_player.mark_value)
            puts "Game over"
            puts "Player #{@current_player.mark_value} has WON!!!"
            return
        else
            switch_turn 
        end
    end
    puts "Draw! Game over"        

end

end