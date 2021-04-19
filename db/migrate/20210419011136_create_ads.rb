class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :banner
      t.string :uri
      t.integer :order
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
