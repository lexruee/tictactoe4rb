module Tictactoe4rb

  class InputReader

    def input
      raise 'not implemented'
    end

  end

  class TerminalReader < InputReader

    def input
      gets
    end

  end

  class ScriptedReader < InputReader

    def initialize(moves)
      @moves = moves
    end

    def input
      @moves.shift
    end

  end

end