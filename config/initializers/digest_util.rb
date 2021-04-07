module DigestUtil
	# 加密
	def self.encrypt(data)
		# 是否是低成本，默认：生产环境为false
		# 其实就是加密强度，开发环境可以不用这么高的强度
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		# 加密
		BCrypt::Password.create(data, cost: cost)
	end
end