class CreateComments < ActiveRecord::Migration[5.2]
	def change
		create_table :comments do |t|
			#评论类型：0:没有关联数据 10:视频,20:单曲,30:歌单
			t.integer :style, null: false, default: 0
			
			# 评论内容
			t.string :content, null: false
			
			# 评论回复，可以为空
			t.references :parent, index: true
			
			# 谁创建了评论
			t.references :user, foreign_key: true
			
			# 评论引用的视频，可以为空
			t.references :video, foreign_key: true
			
			# 评论引用的歌单，可以为空
			t.references :sheet, foreign_key: true
			
			# 评论引用的歌曲，可以为空
			t.references :song, foreign_key: true
			
			# 评论的点赞数
			t.integer :likes_count, null: false, default: 0
			
			t.timestamps
		end
	end
end
