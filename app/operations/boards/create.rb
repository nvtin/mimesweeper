require "dry/transaction"

module Boards
  class Create
    include Dry::Transaction

    step :validate
    step :create_board
    step :create_cell

    private

    def validate(input)
      validation = Boards::Contracts::New.new.call(input)
      return Success(input) if validation.success?

      Failure(validation)
    end

    def create_board(input)
      board = Board.create!(input)
      Success(board)
    end

    def create_cell(board)
      CellsCreator.new(board: board).call
      Success(board)
    end
  end
end
