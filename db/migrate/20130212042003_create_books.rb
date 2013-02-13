class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :title
      t.integer :volume

      t.timestamps
    end
    add_index :books, :title_id
  end
end
