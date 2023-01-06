class CellsCreator
	def initialize(board:)
		@board = board
	end

	def call
    raise 'Board is required to create cell' if board.blank?

		board.cells.create!(cell_attributes)
	end

	private

	attr_reader :board

	def cell_attributes
		attributes = []
		# Loop through board height and width to generate cell attributes
		board.height.times do |i_row|
			board.width.times do |i_col|
				is_mime = mime_matrix.include? [i_row, i_col]
				attributes << { row: i_row, column: i_col, is_mime: is_mime }
			end
		end
		attributes
	end

	def random_position
		[rand(board.height), rand(board.width)]
	end

	# Generate mime matrix
	def mime_matrix
		return @mime_matrix if @mime_matrix.present?

		@mime_matrix = []
		board.num_mimes.times do
			position = random_position
			while @mime_matrix.include? position
				position = random_position
			end
			@mime_matrix << position
		end
		@mime_matrix
	end
end