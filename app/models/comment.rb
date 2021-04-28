class Comment < ApplicationRecord
	# 回复的评论
	# optional：表示可以为空
	belongs_to :parent, class_name: "Comment", optional: true
	
	# 一个评论，可能有多个子评论
	has_many :children, class_name: "Comment",
	         foreign_key: "parent_id"
	
	belongs_to :user, counter_cache: true
	# 评论点赞
	has_many :likes
	# counter_cache字段
	# 表示在video表中创建comments_count字段
	# 用来缓存评论数量，如果没有创建，要获取数量
	# 就需要执行sql语句
	belongs_to :video, counter_cache: true, optional: true
	belongs_to :sheet, counter_cache: true, optional: true
	belongs_to :song, counter_cache: true, optional: true
	
	# 验证（约束）
	# 内容不能为空，最长不超过140个字
	validates :content, presence: true, length: {maximum: 140 }
	
	# 用户不能为空
	validates :user_id, presence: true
	
	# 默认查询参数
	# 默认按创建时间倒序排列
	default_scope -> { order(created_at: :desc) }
end
