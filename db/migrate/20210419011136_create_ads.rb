class CreateAds < ActiveRecord::Migration[5.2]
	def change
		create_table :ads do |t|
			# 标题
			t.string :title
			
			# 图片地址，相对地址
			# 要显示时，根据不同的环境拼接不同前缀
			t.string :banner, null: false
			
			# 点击后跳转的url
			t.string :uri
			
			# 排序，值越大，越靠前
			t.integer :order, null: false, default: 0
			
			# 那个用户添加的
			t.references :user, foreign_key: true
			
			t.timestamps
		end
	end
end
