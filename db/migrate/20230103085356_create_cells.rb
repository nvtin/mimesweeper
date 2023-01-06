class CreateCells < ActiveRecord::Migration[6.0]
  def change
    create_table :cells do |t|
      t.integer :board_id, null: false
      t.integer :row, null: false
      t.integer :column, null: false
      t.boolean :is_mime, null: false, default: false

      t.timestamps
    end
    add_foreign_key :cells, :boards, column: :board_id, on_delete: :cascade
  end
end
