class CreateLikes < ActiveRecord::Migration[5.2]
	def change
		create_table :likes do |t|
			# 评论
			t.references :comment, foreign_key: true
			
			# 用户
			t.references :user, foreign_key: true
			
			t.timestamps
		end
		
		# 添加索引
		# 评论Id，userId唯一索引
		add_index :likes, [:comment_id, :user_id], unique: true
	end
end
