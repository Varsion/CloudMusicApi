class CreateSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :sheets do |t|
      t.string :title
      t.string :banner
      t.string :description
      t.integer :clicks_count
      t.integer :collections_count
      t.integer :comments_count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
