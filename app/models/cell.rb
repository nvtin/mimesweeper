class Cell < ApplicationRecord
    belongs_to :board

    validates :row, :column, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
