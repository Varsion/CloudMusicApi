json.data @data do |data|
	json.(data, :id, :banner, :description, :clicks_count, :collection_count, :comments_count)
	json.user do
		json.(data.user, :id, :nickname, :avatar)
	end
end