class User < ApplicationRecord
	# 添加密码属性 非数据库字段
	attr_accessor :password
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
	# 密码验证
	validates :password, presence: true, length: {minimum: 6,maximum: 15 }
	# 重写密码加密逻辑
	def password=(unencrypted_password)
		if unencrypted_password.nil?
			self.password_digest = nil
		elsif !unencrypted_password.empty?
			@password = unencrypted_password
			
			self.password_digest = DigestUtil.encrypt(unencrypted_password)
		end
	end
	
	def authenticated? attribute, value
		digest = self.send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(value)
	end
	
	def encrypt_open_id
		if qq_id.present? && qq_id_digest.blank?
			self.qq_id_digest = DigestUtil::encrypt(qq_id)
			self.qq_id = DigestUtil::encrypt_des(qq_id)
		end
		
		if wechat_id.present? && wechat_id_digest.blank?
			self.wechat_id_digest = DigestUtil::encrypt(wechat_id)
			self.wechat_id = DigestUtil::encrypt_des(wechat_id)
		end
	end
end
