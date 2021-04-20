class CreateCollections < ActiveRecord::Migration[5.2]
	def change
		create_table :collections do |t|
			t.references :sheet, foreign_key: true
			t.references :user, foreign_key: true
			
			t.timestamps
		end
		
		# 添加索引
		add_index :collections, [:sheet_id,:user_id], unique: true
	end
end
