class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :avatar
      t.string :description
      t.integer :gender
      t.date :birthday
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :session_digest
      t.string :reset_password_digest
      t.datetime :reset_password_sent_at
      t.string :confirmation_digest
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :qq_id
      t.string :qq_id_digest
      t.string :wechat_id
      t.string :wechat_id_digest

      t.timestamps
    end
  end
end
