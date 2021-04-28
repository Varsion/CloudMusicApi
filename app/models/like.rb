class Like < ApplicationRecord
	# 在评论中缓存点赞数
	belongs_to :comment,counter_cache: true
	
	# 在用户中缓存，点赞数
	belongs_to :user,counter_cache: true
	
	# 验证（约束）
	# 评论不能为空
	validates :comment_id, presence: true
	
	# 用户不能为空
	validates :user_id, presence: true

end
