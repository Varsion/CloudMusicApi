class CreateLabels < ActiveRecord::Migration[5.2]
	def change
		create_table :labels do |t|
			t.references :tag, foreign_key: true
			t.references :sheet, foreign_key: true
			t.references :user, foreign_key: true
			
			t.timestamps
		end
		
		# 添加索引
		# 标签Id，歌单Id，userId唯一索引
		add_index :labels, [:tag_id, :sheet_id, :user_id], unique: true
	end
end
