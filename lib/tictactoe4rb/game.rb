module Tictactoe4rb
  class Game
    attr_reader :players, :board, :moves

    def initialize(players, board)
      @moves = 0
      @players = players
      @board = board
    end

    def move(row, column)
      player = current_player
      @board[row, column] = player.token
      @moves += 1
    end

    def current_player
      @players[@moves%2]
    end

    def finished?
      @board.check
    end
  end
end