module DigestUtil
	# 加密
	def self.encrypt(data)
		# 是否是低成本，默认：生产环境为false
		# 其实就是加密强度，开发环境可以不用这么高的强度
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		# 加密
		BCrypt::Password.create(data, cost: cost)
	end
	
	def self.random_base64_32
		return SecureRandom.urlsafe_base64(32)
	end
	
	# des加密
	def self.encrypt_des(context)
		key=ENV["DES_KEY"]
		cipher = OpenSSL::Cipher::DES.new.encrypt.tap { |obj| obj.key = obj.iv = key }
		(cipher.update(context) + cipher.final).unpack1('H*').upcase
	end
	
	# des解密
	def self.decrypt_des(context)
		key=ENV["DES_KEY"]
		cipher = OpenSSL::Cipher::DES.new.decrypt.tap { |obj| obj.key = obj.iv = key }
		cipher.update([context].pack('H*')) + cipher.final
	end
	
	# 复写MD5加密 随机盐
	def md5 data
		Digest::MD5.hexdigest("J@5B^#{data}JIO@**#!")
	end
end