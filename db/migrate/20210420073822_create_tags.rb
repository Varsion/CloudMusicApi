class CreateTags < ActiveRecord::Migration[5.2]
	def change
		create_table :tags do |t|
			# 标签名
			t.string :title
			
			# 他的父层级Id
			# 添加foreign_key，该值就不能为null
			# t.references :parent, foreign_key: true
			# index：表示添加索引
			t.references :parent, index: true
			
			# 谁创建了这个标签
			t.references :user, foreign_key: true
			
			t.timestamps
		end
		
		# 添加索引
		# 标题，userId唯一索引
		add_index :tags, [:title, :user_id], unique: true
	end
end
