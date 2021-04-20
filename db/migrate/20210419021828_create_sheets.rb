class CreateSheets < ActiveRecord::Migration[5.2]
	def change
		create_table :sheets do |t|
			# 歌单标题，不能为空
			t.string :title, null: false
			
			# 封面
			t.string :banner
			
			# 描述
			t.string :description
			
			# 点击率（点击到详情）
			# 原版是播放音乐量
			t.integer :clicks_count,limit:8
			
			# 收藏数
			t.integer :collections_count,limit:8
			
			# 评论数
			t.integer :comments_count,limit:8
			
			# 创建用户
			t.references :user, foreign_key: true
			
			t.timestamps
		end
	end
end
