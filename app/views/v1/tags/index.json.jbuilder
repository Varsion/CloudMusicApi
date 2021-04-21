json.data @tags do |data|
	json.(data, :id, :title)
	
	# 如果存在子标签， 遍历其子标签
	if data.children.present?
		json.data data.children do |child|
			json.(child, :id, :title, :created_at)
		end
	end
end