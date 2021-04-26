class CreateVideos < ActiveRecord::Migration[5.2]
	def change
		create_table :videos do |t|
			# 视频标题
			t.string :title, null: false
			
			# 视频地址，相对路径
			# 和音乐地址路径差不多
			t.string :uri, null: false
			
			# 视频封面
			t.string :banner, null: false
			
			# 视频时长，单位秒
			t.integer :duration, null: false, default: 0
			
			# 发布人
			t.references :user, foreign_key: true
			
			# 点击量
			t.integer :clicks_count, null: false, default: 0
			
			# 评论数
			t.integer :comments_count, null: false, default: 0
			
			t.timestamps
		end
	end
end
