require 'tictactoe4rb'

  module Tictactoe4rb

   describe Controller do
      before do
        @moves = [
            "Roman",
            "Alex",
            [0, 0],
            [1, 1],
            [0, 1],
            [0, 2],
            [2, 1],
            [2, 0]
        ]
        @scripted_reader = ScriptedReader.new(@moves)
      end
      it "create Game Controller" do
        controller = Controller.new(@scripted_reader)
        controller.play
      end

   end

  end