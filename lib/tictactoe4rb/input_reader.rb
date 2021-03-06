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
      gets.chomp
    end


    def next_move
      str = input
      row, column = str.split(",")
      [row.to_i, column.to_i]
    end

  end


  class ScriptedReader < InputReader

    def initialize(moves)
      @moves = moves
    end


    def input
      input = @moves.shift
      puts "Enter input: %s" % input
      input
    end


    def next_move
      row, column = @moves.shift
      puts "Make move [#{row},#{column}]"
      [row, column]
    end

  end

end