require 'tictactoe4rb'

module Tictactoe4rb

  describe Game do
    before do
      @roman = Player.new("Roman", :x)
      @alex = Player.new("Alex", :o)
      @players = [@roman, @alex]
      @board = Board.new
      @game = Game.new(@players, @board)
    end

    describe "#initialize" do
      it 'create game' do
        expect(@game.players.size).to eq 2
        expect(@game.board).to_not be_nil
      end
    end

    describe "player_moves" do
      it 'player move' do
        expect(@game).to_not be_nil
        expect(@game.current_player).to eq @roman
        expect(@game.moves).to eq 0
        @game.move(1, 1)
        expect(@game.current_player).to eq @alex
        expect(@game.moves).to eq 1
      end
    end
  end

end