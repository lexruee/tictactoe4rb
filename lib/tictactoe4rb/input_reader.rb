module Tictactoe4rb

  class InputReader

    def input
      raise 'not implemented'
    end

    def next_move
      raise 'not implemented'
    end

  end

  class TerminalReader < InputReader

    def input
      gets
    end

    def next_move
      row, column = @moves.shift
      [row.to_i, column.to_i]
    end

  end

  class ScriptedReader < TerminalReader

    def initialize(moves)
      @moves = moves
    end

    def input
      @moves.shift
    end

  end

end