module Tictactoe4rb
  class Player
    attr_reader :name, :token

    def initialize(name, token)
      @name = name
      @token = token
    end
  end
end