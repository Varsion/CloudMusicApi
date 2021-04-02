class CreateUsers < ActiveRecord::Migration[5.2]
	def change
		create_table :users do |t|
			# 昵称，不能为空
			t.string( :nickname, null:false)
			
			# 头像，可以为空
			t.string :avatar
			
			# 个人描述，可以为空
			t.string :description
			
			# 性别，不能为空，默认为0：保密，1：男，2：女
			t.integer :gender, null:false, default:0
			
			# 出生日期，可以为空
			t.date :birthday
			
			# 邮件，不可以为空
			# 大家可以根据业务逻辑调整
			t.string :email, null:false
			
			# 手机号，不可以为空
			t.string :phone, null: false
			
			# 密码，encrypt方法加密
			t.string :password_digest, null:false
			
			# 登录后，保存的token
			# 随机字符串，加密返回给用户
			# 再加密存储
			#
			# 这里保存到一个字段了
			# 所以同时只能登录一个账号
			# 如果要实现Android，iOS平台可以同时登录
			# 只需要将session保存到单独一张表
			t.string :session_digest
			
			# 重置密码令牌，随机字符串返给用户，md5加密存储
			t.string :reset_password_digest
			
			# 重置密码邮件发送时间，用来实现链接有效期
			t.datetime :reset_password_sent_at
			
			# 邮件确认令牌，随机字符串返给用户，md5加密存储
			t.string :confirmation_digest
			
			# 邮件确认时间，有时间表示确认了
			t.datetime :confirmed_at
			
			# 确认邮件发送时间，用来实现链接有效期
			t.datetime :confirmation_sent_at
			
			# QQ第三方登录OpenID
			# 如果要实现多个平台
			# 可以在这里添加多个字段
			# 也可以将这部分信息，放到单独的表中
			# 但这会增加开发难度
			t.string :qq_id, limit:191
			
			# QQ第三方登录OpenID
			# encrypt方法加密
			# 在存储一个加密后的值，目的是可以和密码
			# 统一认证
			t.string :qq_id_digest
			
			# QQ第三方登录OpenID
			t.string :wechat_id, limit:191
			
			# Wechat第三方登录OpenID
			# encrypt方法加密
			t.string :wechat_id_digest
			
			t.timestamps
		end
		
		
		# 添加索引
		# 邮箱唯一索引
		add_index :users,:email,unique:true
		
		# 手机号唯一索引
		add_index :users, :phone, unique: true
		
		# OpenID唯一索引
		add_index :users, :qq_id, unique: true
		
		add_index :users, :wechat_id, unique: true
	
	end
end
