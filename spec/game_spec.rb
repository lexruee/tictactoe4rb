require 'tictactoe4rb'

module Tictactoe4rb
  describe Game do

    context "#initialize" do
      it 'create game' do
        players = [Player.new("Roman", :x), Player.new("Alex", :o)]
        board = Board.new
        game = Game.new(players, board)
        expect(game.players.size).to eq 2
        expect(game.board).to_not be_nil
      end
    end
  end
end