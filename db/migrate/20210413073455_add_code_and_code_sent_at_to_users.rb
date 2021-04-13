class AddCodeAndCodeSentAtToUsers < ActiveRecord::Migration[5.2]
	def change
		# 验证码
		add_column :users, :code, :string
		
		# 验证码发送时间
		# 可以用来判断有效期
		# 控制发送间隔
		add_column :users, :code_sent_at, :datetime
	end
end
