class AddPushToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :push, :string
  end
end
