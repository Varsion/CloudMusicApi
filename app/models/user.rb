class User < ApplicationRecord
	# 表间链接
	has_many :ads
	has_many :sheets
	has_many :songs
	# 收藏多个歌单
	has_many :collections
	# 用于区分创建的歌单和收藏的歌单
	has_many :collection_sheets, through: :collections, source: "sheet"
	# 创建多个标签
	has_many :tags
	# 可创建多个视频
	has_many :videos
	
	# 用户点赞
	has_many :likes
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
	
	def request_email_verification
		# 生成随机字符串，并加密
		confirmation_digest=DigestUtil.md5(DigestUtil.random_base64_32)
		
		# 发送时间
		confirmation_sent_at=Time.now
		
		# 将这两个字段保存到数据库
		# update_attributes:会验证数据格式
		# update_column：不会验证
		unless update_columns({confirmation_digest: DigestUtil.md5(confirmation_digest), confirmation_sent_at: confirmation_sent_at})
			return false
		end
		
		AllMailer.confirm_verification(self, confirmation_digest).deliver_later
	end
	# 邮件是否验证
	def email_verification?
		confirmed_at.present?
	end
	# 是否收藏歌单
	def collection?(sheet_id)
		collections.find_by_sheet_id(sheet_id)
	end
end
