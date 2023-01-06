class AddIndexToSearchableBoard < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index :boards, :searchable, using: :gin, algorithm: :concurrently
  end
end
