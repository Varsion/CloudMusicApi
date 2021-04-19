class CreateSongs < ActiveRecord::Migration[5.2]
	def change
		create_table :songs do |t|
			t.string :title, null: false
			t.string :banner, null: false
			
			# 当前音乐的url
			# 相对地址
			t.string :uri, null: false
			t.integer :clicks_count, null: false, default: 0
			t.integer :comments_count, null: false, default: 0
			
			# 歌词类型
			# 0:LRC，10:KSC
			t.integer :style
			
			# 歌词
			t.text :lyric
			t.references :user, foreign_key: true
			
			# 歌手ID，这里引用的是user
			# 未将用户和歌手区分
			t.integer :singer_id
			
			t.timestamps
		end
	end
end
