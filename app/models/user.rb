class User < ApplicationRecord
	# 验证约束
	# 昵称不能为空 长度1～15
	validates :nickname, presence: true, length: { minimum: 1, maximum: 15 }
	# 性别
	validates :gender, presence: true, inclusion: { in: [0, 1, 2] }
	# 引入系统验证器
	include ActiveModel::Validations
	# 使用手机号验证器
	validates_with PhoneValidator
	# 使用邮箱验证
	# 使用自带验证方法 validates :email, presence: true, email: true
	validates :email, email: true
	# 默认排序 根据创建时间倒序
	default_scope -> { order(created_at: :desc) }
end
