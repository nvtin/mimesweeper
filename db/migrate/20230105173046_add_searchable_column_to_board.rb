class AddSearchableColumnToBoard < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE boards
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('english', coalesce(name, '')), 'A') ||
        setweight(to_tsvector('english', coalesce(creator_email,'')), 'B')
      ) STORED;
    SQL
  end

  def down
    remove_column :boards, :searchable
  end
end
