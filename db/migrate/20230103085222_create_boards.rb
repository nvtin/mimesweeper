class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.integer :width, null: false
      t.integer :height, null: false
      t.integer :num_mimes, null: false
      t.string :name, null: false
      t.string :creator_email, null: false

      t.timestamps
    end

    add_index :boards, :name
    add_index :boards, :creator_email
  end
end
