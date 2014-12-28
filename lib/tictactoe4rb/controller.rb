module Tictactoe4rb

  class Controller

    def initialize(input_reader)
      @reader = input_reader
    end

    def play
      display_welcome
      setup_game
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
      @game = Game.new(players, @board)
    end

  end

end