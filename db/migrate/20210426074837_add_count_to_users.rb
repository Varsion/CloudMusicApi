class AddCountToUsers < ActiveRecord::Migration[5.2]
	def change
		# 歌曲数缓存
		add_column :users, :songs_count, :integer, null: false, default: 0
		
		# 歌单数缓存
		add_column :users, :sheets_count, :integer, null: false, default: 0
		
		# 视频数缓存
		add_column :users, :videos_count, :integer, null: false, default: 0
		
		# 评论数缓存
		add_column :users, :comments_count, :integer, null: false, default: 0
		
		# 点赞数缓存
		add_column :users, :likes_count, :integer, null: false, default: 0
		
		# 关注我的人数缓存
		add_column :users, :followers_count, :integer, null: false, default: 0
		
		# 我的关注的人数缓存
		add_column :users, :followings_count, :integer, null: false, default: 0
	end
end
