class Board < ApplicationRecord
  include PgSearch::Model

  validates :name, :creator_email, :height, :width, :num_mimes, presence: true
  validates :height, :width, numericality: { only_integer: true, greater_than: 0 }
  validates :num_mimes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
