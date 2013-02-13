class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.string :author
      t.boolean :complete

      t.timestamps
    end
  end
end
