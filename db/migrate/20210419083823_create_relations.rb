class CreateRelations < ActiveRecord::Migration[5.2]
	def change
		create_table :relations do |t|
			t.references :song, foreign_key: true
			t.references :sheet, foreign_key: true
			t.references :user, foreign_key: true
			t.timestamps
		end
		
		# 添加索引
		# 歌曲ID，歌单ID，用户ID
		add_index :relations, [:song_id,:sheet_id,:user_id], unique: true
	end
end
