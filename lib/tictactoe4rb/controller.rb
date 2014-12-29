module Tictactoe4rb

  class Controller

    attr_reader :game

    def initialize(input_reader)
      @reader = input_reader
      @game = nil
    end

    def play
      display_welcome
      setup_game
      loop do
        print_board
        player_next_move
        break if @game.finished?
      end
      display_winner
    end

    def display_winner
      if winner = @game.current_player
        puts "Player #{winner.name} wins this round of TicTacToe!"
      else
        puts "That's a draw!"
      end
    end

    def print_board
      @fields = @game.board.map do |value|
        "|#{value}|"
      end

      output = ""
      @fields.each_with_index do |value, index|
        f = "#{value}"
        f += "\n" if (index + 1) % 3 == 0
        output << f
      end
      puts output
    end

    def player_next_move
      loop do
        success = begin
          player_name = @game.current_player.name
          puts "Player #{player_name} next move please!"
          row, column = @reader.next_move
          @game.move(row, column)
          true
        rescue => e
          raise e
          false
        end
        return if success
      end
    end


    def display_welcome
      puts 'Welcome to the TicTacToe RubyGem by Alex & Roman!'
    end

    def setup_game
      @players = []
      {1 => :x, 2 => :o}.each do |num, token|
        puts "Player #{num} please enter your name!"
        @name = @reader.input
        @players << Player.new(@name, token)
      end
      @board = Board.new(3, 3)
      @game = Game.new(@players, @board)
    end

  end

end