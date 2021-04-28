module ApplicationHelper
	def user(json,object)
		json.user do
			json.(object,:id,:nickname,:avatar)
		end
	end
	
	# 分页方法
	def paginate_meta(json,object)
		# current_page：当前页，从1开始
		# next_page：下一页
		# prev_page：上一页
		# total_pages：总页数
		# total_count：总条数
		json.(object,:current_page,:next_page,:prev_page,:total_pages,:total_count)
	end
end