class BoardCreator
    def initialize(options)
      @options = options
    end

    def call
      ActiveRecord::Base.transaction do
        board = Board.create!(options)
        CellsCreator.new(board: board).call
        board
      end
    end

    private

		attr_reader :options
end