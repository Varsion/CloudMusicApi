class Tag < ApplicationRecord
	# 关系
	# 一个标签属于一个用户
	belongs_to :user
	
	# 一个标签有多个子标签
	# 这里是添加了一个children
	# 类名为Tag，外键Id为parent_id
	has_many :children, class_name: "Tag",
	         foreign_key: "parent_id"
	
	# 一个标签可以属于一个标签
	# optional: true：表示parent_id为可选
	belongs_to :parent, class_name: "Tag", optional: true
	
	# 标签下有多个歌单
	has_many :labels
	has_many :sheets, through: :labels
	
	# 验证（约束）
	# 标题：不能为空，长度1~15。
	validates :title, presence: true, length: {minimum: 1,maximum: 15 }
	
	# 查询第一层标签
	def self.first_level
		Tag.where('parent_id IS NULL')
	end
	# 查询指定层标签
	def self.next_level parent_id
		Tag.where('parent_id = ?', parent_id)
	end
	
end
