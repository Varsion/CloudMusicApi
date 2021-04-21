json.data @videos do |data|
	json.(data, :id, :title, :uri, :banner, :duration, :clicks_count, :comments_count, :created_at)
	json.user do
		json.(data.user, :id, :nickname, :avatar)
	end
end