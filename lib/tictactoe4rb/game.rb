module Tictactoe4rb
  class Game
    attr_reader :players, :board, :moves, :previous_player

    def initialize(players, board)
      @moves = 0
      @players = players
      @board = board
    end

    def move(row, column)
      player = current_player
      @board[row, column] = player.token
      @previous_player = player
      @moves += 1
    end

    def current_player
      @players[@moves%2]
    end

    def finished?
      @board.check(previous_player) || @board.full?
    end

    def winner
      if @board.check(previous_player)
        previous_player
      else
        false
      end
    end
  end
end