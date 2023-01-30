class Board < ApplicationRecord
  include PgSearch::Model

  has_many :cells, dependent: :delete_all

  # Define search fields
  pg_search_scope :search_board,
                  against: { name: 'A', creator_email: 'B' },
                  using: {
                    tsearch: {
                      dictionary: 'english', tsvector_column: 'searchable'
                    }
                  }
end
