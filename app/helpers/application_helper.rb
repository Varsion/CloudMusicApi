module ApplicationHelper
	def user(json,object)
		json.user do
			json.(object,:id,:nickname,:avatar)
		end
	end
end